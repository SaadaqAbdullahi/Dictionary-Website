package worddao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import wordmodel.word;

public class wordDAO {
	
	static final String  DB_URL = "jdbc:mysql://localhost:8889/dictionary?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	static final String USER = "root";
	static final String PASS = "root";
	
	private static final String INSERT_WORD = "INSERT INTO definitions (term, definition, example) VALUES (?, ?, ?);";
	private static final String RETRIEVE_WORD_BY_ID = "SELECT id, term, definition, example from definitions WHERE id = ?";
	private static final String RETRIEVE_WORD_BY_NAME = "SELECT id, definition, example from definitions WHERE term = ?";
	private static final String RETRIEVE_ALL_WORDS =  "SELECT * FROM definitions";
	private static final String DELETE_WORD =  "DELETE FROM definitions WHERE id = ?";
	private static final String UPDATE_WORD =  "UPDATE definitions SET term = ?, definition = ?, example = ? WHERE id = ?";
	
	protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, USER, PASS);
        } 
        catch (SQLException e) {
            e.printStackTrace();
        } 
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
	
	public void insertWord(word word) throws SQLException {
        try (Connection connection = getConnection(); 
        		PreparedStatement preparedStatement = connection.prepareStatement(INSERT_WORD)) {
            preparedStatement.setString(1, word.getTerm());
            preparedStatement.setString(2, word.getDefinition());
            preparedStatement.setString(3, word.getExample());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } 
        catch (SQLException e) {
        	e.printStackTrace();
            //printSQLException(e);
        }
    }
	
	public word getWordByName(String term) {
        word word = null;
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(RETRIEVE_WORD_BY_NAME)) {
            preparedStatement.setString(1, term);
            ResultSet result = preparedStatement.executeQuery();
            while (result.next()) {
            	int id = result.getInt("id");
                String definition = result.getString("definition");
                String example = result.getString("example");
                word = new word(id, term, definition, example);
            }
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        return word;
    }
	
	public word getWordById(int id) {
        word word = null;
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(RETRIEVE_WORD_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet result = preparedStatement.executeQuery();
            while (result.next()) {
                String term = result.getString("term");
                String definition = result.getString("definition");
                String example = result.getString("example");
                word = new word(id, term, definition, example);
            }
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        return word;
    }
	
	public List < word > getAllWords() {
        List < word > words = new ArrayList < > ();
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(RETRIEVE_ALL_WORDS);) {
            ResultSet result = preparedStatement.executeQuery();
            while (result.next()) {
                int id = result.getInt("id");
                String term = result.getString("term");
                String definition = result.getString("definition");
                String example = result.getString("example");
                words.add(new word(id, term, definition, example));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return words;
    }
	
	public boolean deleteWord(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); 
        		PreparedStatement statement = connection.prepareStatement(DELETE_WORD);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateUser(word word) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); 
        		PreparedStatement statement = connection.prepareStatement(UPDATE_WORD);) {
            statement.setString(1, word.getTerm());
            statement.setString(2, word.getDefinition());
            statement.setString(3, word.getExample());
            statement.setInt(4, word.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}

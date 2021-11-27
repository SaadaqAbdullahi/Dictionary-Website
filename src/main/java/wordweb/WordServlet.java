package wordweb;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.regex.Pattern;

import worddao.wordDAO;
import wordmodel.word;


@WebServlet("/")
public class WordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private wordDAO wordDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WordServlet() {
        this.wordDAO = new wordDAO();
    }
    
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		System.out.println(action);

        try {
            switch (action) {
                case "/new":
                    showNewWordForm(request, response);
                    break;
                case "/insert":
                    addNewWord(request, response);
                    break;
                case "/delete":
                    deleteWord(request, response);
                    break;
                case "/edit":
                    showEditNewWordForm(request, response);
                    break;
                case "/update":
                    updateWord(request, response);
                    break;
                case "/search":
                	showSearchedWord(request, response);
                	break;
                default:
                    allWords(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
	}
	
	private void showNewWordForm(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		        RequestDispatcher dispatcher = request.getRequestDispatcher("add_new_word.jsp");
		        dispatcher.forward(request, response);
		    }
	
	private void showEditNewWordForm(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, ServletException, IOException {
		        int id = Integer.parseInt(request.getParameter("id"));
		        word selectedWord = wordDAO.getWordById(id);
		        RequestDispatcher dispatcher = request.getRequestDispatcher("edit_word.jsp");
		        request.setAttribute("word", selectedWord);
		        dispatcher.forward(request, response);
		    }
	
	private void updateWord(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, ServletException, IOException {
		        int id = Integer.parseInt(request.getParameter("id"));
		        String term = request.getParameter("term");
		        String definition = request.getParameter("definition");
		        String example = request.getParameter("example");
		        if (term.length() == 0 || definition.length() == 0 || example.length() == 0) {
		        	System.out.println("empty!");
		        	String error_term_empty = "";
		        	String error_def_empty = "";
		        	String error_exam_empty = "";
		        	if(term.length() == 0) {
		        		error_term_empty = "Term cannot be empty!";
		        	}
		        	if(definition.length() == 0) {
		        		error_def_empty = "Definition cannot be empty!";
		        	}
		        	if(example.length() == 0) {
		        		error_exam_empty = "Example cannot be empty!";
		        	}
		        	RequestDispatcher dispatcher = request.getRequestDispatcher("add_new_word.jsp");
	        		request.setAttribute("empty_term", error_term_empty);
	        		request.setAttribute("empty_def", error_def_empty);
	        		request.setAttribute("empty_exam", error_exam_empty);
	        		dispatcher.forward(request, response);
		        }
		        else if (!Pattern.matches("[a-zA-Z ,.']+",term) || !Pattern.matches("[a-zA-Z .,']+",definition) || !Pattern.matches("[a-zA-Z ,.']+",example)) {
		        	System.out.println("letters!");
		        	String error_term_letter = "";
		        	String error_def_letter = "";
		        	String error_exam_letter = "";
		        	if(!Pattern.matches("[a-zA-Z ,.']+",term)) {
		        		error_term_letter = "Term can only contain letters!";
		        	}
		        	if(!Pattern.matches("[a-zA-Z .',]+",definition)) {
		        		error_def_letter = "Definition can only contain letters!";
		        	}
		        	if(!Pattern.matches("[a-zA-Z ,.']+",example)) {
		        		error_exam_letter = "Example can only contain letters!";
		        	}
		        	RequestDispatcher dispatcher = request.getRequestDispatcher("add_new_word.jsp");
	        		request.setAttribute("letter_term", error_term_letter);
	        		request.setAttribute("letter_def", error_def_letter);
	        		request.setAttribute("letter_exam", error_exam_letter);
	        		dispatcher.forward(request, response);
		        }
		        else {
		        	word word = new word(id, term, definition, example);
		        	wordDAO.updateUser(word);
		        	RequestDispatcher dispatcher = request.getRequestDispatcher("edit_word.jsp");
		        	String type = "updated";
		        	request.setAttribute("word", word);
		        	request.setAttribute("type", type);
		        	dispatcher.forward(request, response);
		        }
	}
	
	private void addNewWord(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, ServletException, IOException {
		        String term = request.getParameter("term");
		        String definition = request.getParameter("definition");
		        String example = request.getParameter("example");
		        if (term.length() == 0 || definition.length() == 0 || example.length() == 0) {
		        	System.out.println("empty!");
		        	String error_term_empty = "";
		        	String error_def_empty = "";
		        	String error_exam_empty = "";
		        	if(term.length() == 0) {
		        		error_term_empty = "Term cannot be empty!";
		        	}
		        	if(definition.length() == 0) {
		        		error_def_empty = "Definition cannot be empty!";
		        	}
		        	if(example.length() == 0) {
		        		error_exam_empty = "Example cannot be empty!";
		        	}
		        	RequestDispatcher dispatcher = request.getRequestDispatcher("add_new_word.jsp");
	        		request.setAttribute("empty_term", error_term_empty);
	        		request.setAttribute("empty_def", error_def_empty);
	        		request.setAttribute("empty_exam", error_exam_empty);
	        		dispatcher.forward(request, response);
		        }
		        else if (!Pattern.matches("[a-zA-Z ,.']+",term) || !Pattern.matches("[a-zA-Z ,.']+",definition) || !Pattern.matches("[a-zA-Z ,.']+",example)) {
		        	System.out.println("letters!");
		        	String error_term_letter = "";
		        	String error_def_letter = "";
		        	String error_exam_letter = "";
		        	if(!Pattern.matches("[a-zA-Z ,.']+",term)) {
		        		error_term_letter = "Term can only contain letters!";
		        	}
		        	if(!Pattern.matches("[a-zA-Z ,.']+",definition)) {
		        		error_def_letter = "Definition can only contain letters!";
		        	}
		        	if(!Pattern.matches("[a-zA-Z ,.']+",example)) {
		        		error_exam_letter = "Example can only contain letters!";
		        	}
		        	RequestDispatcher dispatcher = request.getRequestDispatcher("add_new_word.jsp");
	        		request.setAttribute("letter_term", error_term_letter);
	        		request.setAttribute("letter_def", error_def_letter);
	        		request.setAttribute("letter_exam", error_exam_letter);
	        		dispatcher.forward(request, response);
		        }
		        else {
		        	word newWord = new word(term, definition, example);
		        	wordDAO.insertWord(newWord);
		        	RequestDispatcher dispatcher = request.getRequestDispatcher("add_new_word.jsp");
		        	request.setAttribute("word", newWord);
		        	dispatcher.forward(request, response);
		        }
	}
	
	private void deleteWord(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, ServletException, IOException {
		        int id = Integer.parseInt(request.getParameter("id"));
		        String term = request.getParameter("term");
		        wordDAO.deleteWord(id);
		        RequestDispatcher dispatcher = request.getRequestDispatcher("word_deleted.jsp");
		        request.setAttribute("term", term);
		        dispatcher.forward(request, response);
		    }
	
	private void showSearchedWord(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
				System.out.println("Searching!");
				String term = request.getParameter("term");
				word searchedWord = wordDAO.getWordByName(term);
				if(searchedWord == null) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("not_found.jsp");
					request.setAttribute("term", term);
					dispatcher.forward(request, response);
				}
				else {
					RequestDispatcher dispatcher = request.getRequestDispatcher("searched_word.jsp");
					request.setAttribute("word", searchedWord);
					System.out.println(term);
					dispatcher.forward(request, response);
				}
    }
	
	private void allWords(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, IOException, ServletException {
				System.out.println("Grabbing words!");
		        List < word > allWords = wordDAO.getAllWords();
		        request.setAttribute("listOfWords", allWords);
		        RequestDispatcher dispatcher = request.getRequestDispatcher("all_words.jsp");
		        dispatcher.forward(request, response);
		    }
}

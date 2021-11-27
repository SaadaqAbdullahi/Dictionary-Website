package wordmodel;

public class word {
	private int id; 
	private String term;
	private String definition;
	private String example;
	
	public word(int id, String term, String definition, String example) {
		super();
		this.id = id;
		this.term = term;
		this.definition = definition;
		this.example = example;
	}

	public word(String term, String definition, String example) {
		super();
		this.term = term;
		this.definition = definition;
		this.example = example;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getTerm() {
		return term;
	}
	
	public void setTerm(String term) {
		this.term = term;
	}
	
	public String getDefinition() {
		return definition;
	}
	
	public void setDefinition(String definition) {
		this.definition = definition;
	}
	
	public String getExample() {
		return example;
	}
	
	public void setExample(String example) {
		this.example = example;
	} 
}

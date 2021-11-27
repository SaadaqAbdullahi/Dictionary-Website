<%@ page import="wordmodel.word" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Word Form</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<style>
	* {box-sizing: border-box;}

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}
.header {
padding: 10px 10px;
}

.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.button1 {
  background-color: white; 
  color: black; 
  border: 2px solid #ADD8E6;
}

.button1:hover {
  background-color: #ADD8E6;
  color: white;
}


.home_def_style {
	background-color: #F0F0F0;
  	width: 500px;
  	border: 15px;
  	padding: 10px;
  	margin-top: 70px;
  	margin-left: 300px;
  	margin-right: 300px;
}

.topnav {
  overflow: hidden;
  background-color: #ADD8E6;
}

.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #2196F3;
  color: white;
}

.topnav .search-container {
  float: right;
}

.topnav input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 17px;
  border: none;
}

.topnav .search-container button {
  float: right;
  padding: 6px;
  margin-top: 8px;
  margin-right: 16px;
  background: #ddd;
  font-size: 17px;
  border: none;
  cursor: pointer;
}

.topnav .search-container button:hover {
  background: #ccc;
}

@media screen and (max-width: 600px) {
  .topnav .search-container {
    float: none;
  }
  .topnav a, .topnav input[type=text], .topnav .search-container button {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
  }
  .topnav input[type=text] {
    border: 1px solid #ccc;  
  }
}
	</style>
<body style="background-color:#D3D3D3">
	<div class="topnav">
  		<a href="index.jsp">Home</a>
  		<a href="add_new_word.jsp">Add a Word</a>
  		<a href="allwords">All Words</a>
  		<div class="search-container">
    		<form action="search" method="post">
      		<input type="text" placeholder="Search a Word.." name="term">
      		<button type="submit">Search</button>
    		</form>
  		</div>
	</div>
	<div class="home_def_style border border-info">
	<div class="header">
	<center><h1>Add a New Word</h1></center>
	</div>
	
	<form action="insert" method="post">
	<div class="form-group">
	<label for="term">Word</label>
	<input type="text" name="term" class="form-control" id="term" placeholder="Enter a term..."><br/>
	<%
	String empty_term = (String)request.getAttribute("empty_term");
	String letter_term = (String)request.getAttribute("letter_term");
	if (empty_term != null){
	%>
	<p style=color:red>
	<% 
		out.println(empty_term);
	}
	%>
	</p>
	<%
	if(letter_term != null){
	%>
	<p style=color:red>
	<% 
		out.println(letter_term);
	}
	%>
	</p>
	</div>
	<div class="form-group">
	<label for="definition">Definition</label>
	<input type="text" name="definition" class="form-control" id="definition" placeholder="Enter definition..."><br/>
	<%
	String empty_def = (String)request.getAttribute("empty_def");
	String letter_def = (String)request.getAttribute("letter_def");
	if (empty_def != null){
	%>
	<p style=color:red>
	<% 
		out.println(empty_def);
	}
	%>
	</p>
	<%
	if(letter_def != null){
	%>
	<p style=color:red>
	<% 
		out.println(letter_def);
	}
	%>
	</p>
	</div>
	<div class="form-group">
	<label for="example">Example</label>
	<input type="text" name="example" class="form-control" id="example" placeholder="Enter example of word used in a sentence..."><br/>
	<%
	String empty_exam = (String)request.getAttribute("empty_exam");
	String letter_exam = (String)request.getAttribute("letter_exam");
	if (empty_exam != null){
	%>
	<p style=color:red>
	<% 
		out.println(empty_exam);
	}
	%>
	</p>
	<%
	if(letter_exam != null){
	%>
	<p style=color:red>
	<% 
		out.println(letter_exam);
	}
	%>
	</p>
	</div>
	<center><input class="button button1" type="submit" value="Save"></center>
	</form>
	<% word word = (word)request.getAttribute("word"); %>
	<br/><br/>
	<%  if(word != null){%>
	<center><h2 style=color:red>Thank you.<br/> The word <a href="search?term=<c:out value="${word.term}"/>"><i><c:out value="${word.term}"/></a></i> was added to the dictionary!</h2></center>
	<%}%>
	</div>
</body>
</html>
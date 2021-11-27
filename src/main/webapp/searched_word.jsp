<%@ page import="wordmodel.word" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Searched Word</title>
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

.button1 {
  background-color: #4CAF50; 
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

.button12 {
  background-color: white; 
  color: black; 
  border: 2px solid #ADD8E6;
}

.button12:hover {
  background-color: #ADD8E6;
  color: white;
}

.button2 {
  background-color: #4CAF50; 
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

.button22 {
  background-color: white; 
  color: black; 
  border: 2px solid #E1492D;
}

.button22:hover {
  background-color: #E1492D;
  color: white;
}


.box {
	background-color: #D3D3D3;
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
</head>
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
<% word word = (word)request.getAttribute("word"); %>
<div class="box">
<h1 style="font-weight: 900"><c:out value="${word.term}"/></h1>
<p><u>Definition</u></p>
<ol>
<li><c:out value="${word.definition}"/></li>
</ol>
<br/>
<p><u>Used in a sentence:</u></p>
<i><c:out value="${word.example}"/></i><br/><br/>
<form action="edit?id=<c:out value='${word.id}'/>" method="post">
<input class="button1 button12" type="submit" value="Edit">
</form>
<form action="delete?id=<c:out value='${word.id}'/>&term=<c:out value='${word.term}'/>" method="post">
<input class="button2 button22" type="submit" value="Delete">
</form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show All Words</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
	* {box-sizing: border-box;}

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
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
  	width: 1000px;
  	border: 15px;
  	padding: 10px;
  	margin: 20px;
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
  .list-group{
      display:inline-block;
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
<br/><br/>
<div class="container center_div">
<center>
<h1>Browse AIS Dictionary</h1>
<p>Below are a list of every word in our dictionary database</p>
	<c:forEach var="words" items="${listOfWords}">
		<a href="search?term=<c:out value='${words.term}'/>" class="list-group-item list-group-item-action border border-info ml-auto"><center><c:out value="${words.term}" /></center></a>
	</c:forEach>
</div>
</center>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dictionary Home Page</title>
<style>
* {box-sizing: border-box;}

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
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
<center><h1>Welcome to AIS Tech Online Dictionary!</h1></center>
<div class="home_def_style">
	<h1>Word of the Day</h1>
	<h2>online dictionary</h2>
	<p>[<b>on</b>-lahyn <b>dik</b>-shuh-ner-ee, <b>awn</b>-lahyn]</p>
	<p>noun, plural on·line dic·tion·ar·ies.</p>
	<ol>
		<li>a dictionary that is available on the internet or World Wide Web and accessed through a web browser using a computer or a mobile device, primarily by typing a query term into a search box on the site. Online dictionaries like Dictionary.com offer immediate, direct access through large databases to a word's spelling and meanings, plus a host of ancillary information, including its variant spellings, pronunciation, inflected forms, origin, and derived forms, as well as supplementary notes on matters of interest or concern about how the word is used.</li>
	</ol>
	<br/>
	<p>ORIGIN OF ONLINE DICTIONARY<br/>First recorded in 1975–80</p>
	<br/>
	<p>WORDS NEARBY ONLINE DICTIONARY<br/>On Liberty, onliest, on-limits, online, online catalog, online dictionary, onliner, online thesaurus, onload, onlooker, onlooking</p>
</div>
<body>
</body>
</html>

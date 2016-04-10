<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style1.css" rel='stylesheet' type='text/css'>
<script src="js/login.js"></script>
</head>
<body>
<body> 
<div class="header"></div>
<div class="header1">
<div id="headertext" class="header1" >Welcome!</div>
</div>
<div class="bodyx">

 <center> 
 
 <div class="login">
 <h1>Login</h1>
  <br/><br/> <br/>
  
 <form action="LoginCheck.jsp" onsubmit="return validate()" method="post"> <br/>
     Username:  <input type="text" name="username" id="username" > 
     <br/><br/>
     	Password:   <input type="password" name="password" id="password" > <br/><br/>
     	<input type="submit" value="Submit"> 
  </form> 
  </div>
  
  </center> 
 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="CreateProfile.jsp" method="post">

First Name: <input type="text" name="fname" ></br>
Last Name: <input type="text" name="lname"></br>
User Name: <input type="text" name="uname"></br>
Password : <input type="text" name="pwd"></br>
Phone No:: <input type="tel" name="phno"></br>
DOB: <input type="date" data-date-inline-picker="true" name="dob" /></br></br></br></br></br>


 <input type="submit" value="CreateProfile"> 
</form>

</body>
</html>
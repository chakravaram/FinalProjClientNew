<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style1.css" rel='stylesheet' type='text/css'>
<script src="js/profile.js"></script>
</head>
<body>
<%@page import="ksu.chakravaram.client.modelclasses.Profiles" %>
<div class="header"></div>
<div class="header1">
<%Profiles c=(Profiles)session.getAttribute("Profile"); %>
<div id="headertext" class="header1" >Welcome <%=c.getFirstname()+" "+c.getLastname() %> </div>
</div>

<div class="header3">

<a href="logout.jsp" class="button">LOGOUT</a>
</div>

<div class="leftcolumn">
<table>
</br></br>
<a href="AddPost.jsp" class="button" method="post">AddPost</a>
<a href="ViewAllPosts.jsp" class="button" method="post">ViewAllPosts</a>
<a href="ViewAllMessages.jsp" class="button" method="post">ViewAllMessages</a>
<a href="SendMessage.jsp" class="button" method="post">SendMessage</a>
<% if(session.getAttribute("role").equals("admin")){ %>
<a href="CreateProfileForm.jsp" class="button" method="post">CreateNewProfile</a>
<a href="DeleteProfile.jsp" class="button" method="post">DeleteProfile</a>
<%} %>
</table>
</div>


<div class="maincolumn">
<div class="inmain">
  
  
 <p><font size="6" color="#142170">Create Profile Here !</font></p>
 
 <p><font size="2" color="red">User Name Already Exists! Try With Different UserName!</font></p>

<form action="CreateProfile.jsp" onsubmit="return validate()" method="post">
<table>
<tr><td>First Name</td><td> <input type="text" name="fname" id="fname" ></td></tr></br>
<tr><td>Last Name</td><td> <input type="text" name="lname" id="lname"></td></trr>
<tr><td>User Name </td><td><input type="text" name="uname" id="uname"></td></tr>
<tr><td>Password </td><td> <input type="text" name="pwd" id="pwd"></td></tr>
<tr><td>Phone No</td><td> <input type="number" name="phno" id="phno"></td></tr>
<tr><td>DOB: </td><td><input type="date" data-date-inline-picker="true" name="dob" id="dob"/></br></br></br></td></tr>
</table></br></br>
ProfilePicture: <input type="file" id="filename" name="path" ></br></br></br></br>


 <input type="submit" value="Create" class="button"> 
</form>
</div>
</div>
</body>
</html>
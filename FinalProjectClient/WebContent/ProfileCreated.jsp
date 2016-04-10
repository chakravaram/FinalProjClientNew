<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style1.css" rel='stylesheet' type='text/css'>




</head>
<body>
<%@page import= "java.io.StringReader,
				ksu.chakravaram.client.modelclasses.SendPost,
				ksu.chakravaram.client.modelclasses. IntegerValue,
				com.sun.jersey.api.client.Client,
 				com.sun.jersey.api.client.ClientResponse,
 				com.sun.jersey.api.client.WebResource,
				javax.xml.bind.JAXBContext,
				javax.xml.bind.Unmarshaller "   %>
  
  
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
  
  
 
  	<p><font size="6" color="#142170">Profile Created Successfully!</font></p></br></br>
  	
  		 <%
  	 
  	if(session.getAttribute("role").equals("admin")){
  	 %>
  	 
  	 <a href="AdminHome.jsp" class="button" method="post">Home</a>
  	 <%}else{ %>
  	 
  	  <a href="home.jsp" class="button" method="post">Home</a>
          
  	 
  	 <%}%>
  	 </div>
          </div>
          
</body>
</html>
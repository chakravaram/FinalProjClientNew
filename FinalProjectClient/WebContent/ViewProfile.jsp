<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import= "java.io.StringReader,
ksu.chakravaram.client.modelclasses.Profiles,
                 
 				ksu.chakravaram.client.DAO.DAO"
%>
<%

String s=request.getParameter("id");
int id=Integer.parseInt(s.trim());
DAO a=new DAO();
Profiles p=a.viewProfile(id);

%>
<h2 align="center"> Profile Details of <%=p.getFirstname().toUpperCase() %> </h2></br></br>
User Name: <%=p.getUsername().toUpperCase() %></br>
First Name: <%=p.getFirstname().toUpperCase() %></br>
Last Name: <%=p.getLastname().toUpperCase() %></br>
Contact Number: <%=p.getPhno()%></br>
Profile Id: <%=p.getProfile_id() %></br>
Date of Birth: <%=p.getDob() %></br></br>


</body>
</html>
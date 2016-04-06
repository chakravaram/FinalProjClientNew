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
DAO dao=new DAO();
int i=dao.deleteProfile(id);

if(i==1)
	 response.sendRedirect("DeleteProfile.jsp");
else
	 response.sendRedirect("ProfileDeleteFail.jsp");



%>

</body>
</html>
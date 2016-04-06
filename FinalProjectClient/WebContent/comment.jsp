<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%@page import= "                 
	ksu.chakravaram.client.DAO.DAO"
%>


<%

String post_id=request.getParameter("id");
int pst_id=Integer.parseInt(post_id.trim());
%>

<form action="comment2.jsp?id=<%=pst_id%>"" method="post"> <br/>
<textarea rows="4" cols="50" name="cmt">

</textarea><br/><br/>
<input type="submit" value="Post"> 
</form>
</body>
</html>
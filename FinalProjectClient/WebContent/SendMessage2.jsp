<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

String s=request.getParameter("id");
int to_id=Integer.parseInt(s.trim());
%>

<form action="SendMessage3.jsp?id=<%=to_id%>"" method="post"> <br/>
<textarea rows="4" cols="50" name="msg">

</textarea><br/><br/>
<input type="submit" value="Post"> 
</form>




</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import= "java.io.File,
java.io.FileInputStream,
java.io.PrintWriter,
java.io.ByteArrayOutputStream,
    javax.servlet.http.HttpServletResponse
"%> 
<% 


File file = new File("C:/Users/chakravaram/Desktop/vij.jpg");
byte[] ipg = new byte[(int) file.length()];
response.reset();

response.setContentType("image/jpg");

response.getOutputStream().write(ipg,0,ipg.length);
response.getOutputStream().flush();  
response.getOutputStream().close(); 

file = new File("C:/Users/chakravaram/Desktop/vx.jpg");
ipg = new byte[(int) file.length()];
response.setContentType("image/jpg");

response.getOutputStream().write(ipg,0,ipg.length);
response.getOutputStream().flush();  
response.getOutputStream().close(); 

%>
</body>
</html>
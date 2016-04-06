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
java.io.FileOutputStream,
java.io.File,
javax.servlet.http.HttpServletResponse,
                 
 				ksu.chakravaram.client.DAO.DAO"
%>
<%

//String s=request.getParameter("id");
//int id=Integer.parseInt(s.trim());
DAO a=new DAO();
int id=00;
Profiles p=a.viewProfile(id);
System.out.println("in img");
byte [] img=p.getImage();
FileOutputStream fos=null;
try{
     fos = new FileOutputStream("C:/Users/chakravaram/Desktop/vij"+id+".jpg"); 
    fos.write(img);
    fos.close();
}catch(Exception e){
    e.printStackTrace();
}
%>
<image src="C:/Users/chakravaram/Desktop/vij<%=id %>.jpg" height="42" width="42"/></br></br></br></br>

<%
File f=new File("C:/Users/chakravaram/Desktop/vij0.jpg");
f.delete();

 id=01;
 p=a.viewProfile(id);
System.out.println("in img");
img=p.getImage();
try{
     fos = new FileOutputStream("C:/Users/chakravaram/Desktop/vij"+id+".jpg"); 
    fos.write(img);
    fos.close();
}catch(Exception e){
    e.printStackTrace();
}

%>
<image src="C:/Users/chakravaram/Desktop/vij<%=id%>.jpg" height="42" width="42"/></br></br></br></br>
<%
f=new File("C:/Users/chakravaram/Desktop/vij1.jpg");
f.delete();
%>

</body>
</html>
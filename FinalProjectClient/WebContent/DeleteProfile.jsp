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
ksu.chakravaram.client.modelclasses.ListProfiles,



                 
 				ksu.chakravaram.client.DAO.DAO"
%>





<%
DAO dao=new DAO();
ListProfiles p=dao.viewAllProfiles();
System.out.println("jsp view all profiles");

for(Profiles pf :p.getProfiles())
{
	
    int mid=pf.getProfile_id();
    
    %>
   
        <h1>From : <%=pf.getFirstname().toUpperCase()+" "+pf.getLastname().toUpperCase()+""+pf.getProfile_id()%></br>
        <a href="DeleteProfile2.jsp?id=<%=mid%>"> click to delete</a>
       
              
               
        
        
        
    
    <%
}

%>



</body>
</html>
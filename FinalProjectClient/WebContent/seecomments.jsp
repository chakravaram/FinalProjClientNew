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
ksu.chakravaram.client.modelclasses.Profiles,
ksu.chakravaram.client.modelclasses.ListComments,
ksu.chakravaram.client.modelclasses.Comments,


                 
 				ksu.chakravaram.client.DAO.DAO"
%>

<% 
String post_id=request.getParameter("id");
int pst_id=Integer.parseInt(post_id.trim());
DAO dao=new DAO();
ListComments c=dao.getAllComments(pst_id);


if(c.getCmts()==null)
{
	
	%>
	
	This post has no Comments!!
	
	<%
	
}
else
{
	
for(Comments com : c.getCmts())
{
	int pfid=com.getProfile_id();
	Profiles p=dao.viewProfile(pfid);
	String comm=com.getCmt();
	
	
	%>
	
	<a href="ViewProfile.jsp?id=<%=pfid%>"><%=p.getFirstname().toUpperCase()+""+p.getLastname().toUpperCase() %></a></br>
	<%=comm %></br>
	
	
	<%
	
}


}


%>

</body>
</html>
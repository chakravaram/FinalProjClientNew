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
<%@page import= "
ksu.chakravaram.client.modelclasses.Profiles,
ksu.chakravaram.client.modelclasses.ListLikes,
ksu.chakravaram.client.modelclasses.Like,


                 
 				ksu.chakravaram.client.DAO.DAO"
%>

			
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

<% 
String post_id=request.getParameter("id");
int pst_id=Integer.parseInt(post_id.trim());
DAO dao=new DAO();
ListLikes l=dao.getAllLikes(pst_id);


if(l.getLikes()==null)
{
	
	%>
	<p><font size="6" color="#142170">This post has no likes!</font></p>
	
	
	<%
	
}
else
{
	
for(Like lik : l.getLikes())
{
	int pfid=lik.getProfile_id();
	Profiles p=dao.viewProfile(pfid);
	
	
	%>
	
	<a href="ViewProfile.jsp?id=<%=pfid%>"><%=p.getFirstname().toUpperCase()+""+p.getLastname().toUpperCase() %></a></br>
	
	
	<%
	
}


}


%>
</div>
</div>
</body>
</html>
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
ksu.chakravaram.client.modelclasses.ListComments,
ksu.chakravaram.client.modelclasses.Comments,


                 
 				ksu.chakravaram.client.DAO.DAO"
%>

					<div class="header"></div>
<div class="header1">
<%Profiles c1=(Profiles)session.getAttribute("Profile"); %>
<div id="headertext" class="header1" >Welcome <%=c1.getFirstname()+" "+c1.getLastname() %> </div>
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


<% 
String post_id=request.getParameter("id");
int pst_id=Integer.parseInt(post_id.trim());
DAO dao=new DAO();
ListComments c=dao.getAllComments(pst_id);


if(c.getCmts()==null)
{
	
	%>
	 <p><font size="6" color="#142170">This Post Has No Comments!!</font></p>
	
	
	 
	
	<%
	
}
else
{
	%>
	
	<table width="75%"  cellspacing="10">	
	<%
for(Comments com : c.getCmts())
{
	int pfid=com.getProfile_id();
	Profiles p=dao.viewProfile(pfid);
	String comm=com.getCmt();
	
	
	%>
	<tr>
	
	<td width=100><a href="ViewProfile.jsp?id=<%=pfid%>" ><%=p.getFirstname().toUpperCase()+""+p.getLastname().toUpperCase()  %></a></td>
	<td><%=comm %></td>
	</tr>
	
	<%
	
}


}


%>
</table>
</body>
</html>
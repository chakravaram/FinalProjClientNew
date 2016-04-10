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
<%@page import= "java.io.StringReader,
ksu.chakravaram.client.modelclasses.Profiles,
	java.io.FileOutputStream,
                 
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

String s=request.getParameter("id");
int id=Integer.parseInt(s.trim());
DAO a=new DAO();
Profiles p=a.viewProfile(id);
int mid=p.getProfile_id();
if(p.getProfile_id()!=0)
{
	 byte [] img=p.getImage();
	    FileOutputStream fos=null;
	    try{
	         fos = new FileOutputStream("D:/LocalGitRepo/FinalProjectClient/FinalProjectClient/WebContent/images/"+mid+".jpg"); 
	        fos.write(img);
	        fos.flush();
	        fos.close();
	    }catch(Exception e){
	        e.printStackTrace();
	    }
}

%>
<p><font size="6" color="#142170">Profile Details of <%=p.getFirstname().toUpperCase() %></font></p></br>
<table width="100%"  cellspacing="10">	

<td width="170"  rowspan=7> <image src="images/<%=mid %>.jpg" height="220" width="200"/>   </td> 

<tr><td width=100>User Name <td><%=p.getUsername().toUpperCase() %></br>
<tr><td>First Name<td> <%=p.getFirstname().toUpperCase() %></br>
<tr><td>Last Name<td> <%=p.getLastname().toUpperCase() %></br>
<tr><td>Contact Number <td><%=p.getPhno()%></br>
<tr><td>Profile Id <td><%=p.getProfile_id() %></br>
<tr><td>DOB<td> <%=p.getDob() %></br></br>

</table>
</body>
</html>
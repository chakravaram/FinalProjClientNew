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
ksu.chakravaram.client.modelclasses.ListProfiles,
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
<p><font size="6" color="#142170">Send Your Message !</font></p>


<table width="30%"  cellspacing="10">


<%
DAO dao=new DAO();
ListProfiles p=dao.viewAllProfiles();
System.out.println("jsp view all profiles");

for(Profiles pf :p.getProfiles())
{
	
    int mid=pf.getProfile_id();
    byte [] img=pf.getImage();
    FileOutputStream fos=null;
    try{
         fos = new FileOutputStream("D:/LocalGitRepo/FinalProjectClient/FinalProjectClient/WebContent/images/"+mid+".jpg"); 
        fos.write(img);
        fos.close();
    }catch(Exception e){
        e.printStackTrace();
    }
    
    %>
    
    
    <tr >
      <td width="70"> <image src="images/<%=mid %>.jpg" height="70" width="70"/>   </td> 
     
      
      <td align="center">  <a href="SendMessage2.jsp?id=<%=mid%>" > <%=pf.getFirstname().toUpperCase()+" "+pf.getLastname().toUpperCase()%> </a> </td>
     
        

       <%
}

%>
</table>

</div>
</table>
</body>
</html>
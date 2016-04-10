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
<h2 align="center"> Here are all the Posts </h2></br></br>
<%@page import= "java.io.StringReader,
ksu.chakravaram.client.modelclasses.Post,
ksu.chakravaram.client.modelclasses.ListPosts,
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


		

 

<%
DAO dao=new DAO();
ListPosts p=dao.viewPosts();
String s=session.getAttribute("pid").toString();
int pid=Integer.parseInt(s);

for(Post pst :p.getPosts())
{
	Profiles pf= dao.viewProfile(pst.getProfile_id());
	int mid=pf.getProfile_id();
	int post_id=pst.getPost_id();
	 byte [] img=pf.getImage();
	    FileOutputStream fos=null;
	    try{
	         fos = new FileOutputStream("D:/LocalGitRepo/FinalProjectClient/FinalProjectClient/WebContent/images/"+mid+".jpg"); 
	        fos.write(img);
	        fos.flush();
	        fos.close();
	    }catch(Exception e){
	        e.printStackTrace();
	    }
    
    %>
    <table width="75%"  cellspacing="10">	
       <tr>
       <td colspan="3"> <a href="ViewProfile.jsp?id=<%=mid%>"> <%=pf.getFirstname().toUpperCase()+" "+pf.getLastname().toUpperCase()%> </a>
        <td colspan="1"><%=pst.getTime() %></td>   
        </tr>
       
     <tr>
       <td width="70"> <image src="images/<%=mid %>.jpg" height="70" width="70"/>   </td> 
       <td colspan=3>  <%=pst.getPost()%> </td>    
     </tr>   
            
        <tr>  
          
       
       <%               
       int a=dao.isLiked(pid,post_id);
       if(a==0)
       {
              
       %>
            <td> <a href="Like.jsp?id=<%=post_id%>" method="post" class="button1">Like</a></td>
                    <%
       }
          else {        	  
          
        %>
            <td><a class="button1">Liked</a> </td>
      
       
    
    <%   }%>
    
    <td width="80"> <a href="seelikes.jsp?id=<%=post_id%>" method="post" class="button1">SeeLikes</a></td>
          <td width="80"> <a href="comment.jsp?id=<%=post_id%>" method="post" class="button1">Comment</a>  </td>        
          <td> <a href="seecomments.jsp?id=<%=post_id%>" method="post" class="button1">SeeComments</a></td>
           </tr>
           </table><hr>
    
    <%
}
  
%>

</div>

</body>
</html>
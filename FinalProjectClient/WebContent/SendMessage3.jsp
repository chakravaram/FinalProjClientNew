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
				ksu.chakravaram.client.modelclasses.SendMessage,
				ksu.chakravaram.client.modelclasses. IntegerValue,
				com.sun.jersey.api.client.Client,
 				com.sun.jersey.api.client.ClientResponse,
 				com.sun.jersey.api.client.WebResource,
				javax.xml.bind.JAXBContext,
				javax.xml.bind.Unmarshaller "   %>
				
				
<%@page import="ksu.chakravaram.client.modelclasses.Profiles" %>
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

String id=request.getParameter("id");
int to_id=Integer.parseInt(id.trim());

String s=session.getAttribute("pid").toString();
int from_id=Integer.parseInt(s);

String msg=request.getParameter("msg");
SendMessage m=new SendMessage();
m.setFrom_profile_id(from_id);
m.setMessage(msg);
m.setTo_profile_id(to_id);

Client client = Client.create();
WebResource webResource = client
.resource("http://localhost:8081/WebServices_Final1/backend/profiles/sendmsg");

ClientResponse res = webResource.type("application/xml")
.post(ClientResponse.class,m);
if (res.getStatus() != 200)
       {
	    throw new RuntimeException("Failed : HTTP error code : "	+ response.getStatus());
	    }

try{
	 	String output = res.getEntity(String.class); 		 	  
	 JAXBContext context= JAXBContext.newInstance(IntegerValue.class);	 
	 Unmarshaller um=context.createUnmarshaller();	
	 IntegerValue v= (IntegerValue) um.unmarshal(new StringReader(output));
	 int i=v.getI();	 
	 if(i==1)
	 {
		// response.sendRedirect("ProfileCreated.jsp");
	 %>
	<p><font size="6" color="#142170">Successfully Sent!</font></p></br></br>
	 <%
	 }
	 else{
	 
		 //response.sendRedirect("ProfileCreationError.jsp");
		 %>
		 <p><font size="6" color="#142170">Error Occured in Sending!</font></p></br></br>
		 <%
	 }
	 
	 if(session.getAttribute("role").equals("admin")){
	  	 %>
	  	 
	  	 <a href="AdminHome.jsp" class="button" method="post">Home</a>
	  	 <%}else{ %>
	  	 
	  	  <a href="home.jsp" class="button" method="post">Home</a>
	          
	  	 
	  	 <%}%>
	  	 </div>
	          </div>  <%
	 
	 
	 
	 
	 
	 }
	 
	 
	 catch(Exception e)
	 {
	 	System.out.println("exception"+e);
	 }





%>
</body>
</html>
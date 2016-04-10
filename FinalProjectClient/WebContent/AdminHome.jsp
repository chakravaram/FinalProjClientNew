<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AdminHome</title>
<link href="css/style1.css" rel='stylesheet' type='text/css'>
</head>
<body>
<%@page language="java" %> 
<%@page import= "java.io.StringReader,
                 java.util.ArrayList,
				 java.util.List,

 				com.sun.jersey.api.client.Client,
 				com.sun.jersey.api.client.ClientResponse,
 				com.sun.jersey.api.client.WebResource,
 				ksu.chakravaram.client.modelclasses.Profiles,

 				javax.xml.bind.JAXBContext,
				javax.xml.bind.Unmarshaller" %>
<%

Client client = Client.create();
  
  String s=session.getAttribute("pid").toString();
  int a=Integer.parseInt(s);
WebResource webResource = client
   .resource("http://localhost:8081/WebServices_Final1/backend/profiles/"+a);

ClientResponse res = webResource.accept("application/xml")
           .get(ClientResponse.class);

if (res.getStatus() != 200) {
   throw new RuntimeException("Failed : HTTP error code : "
	+ res.getStatus());
}

try{
	String output = res.getEntity(String.class);
	System.out.println("vijay12");
	  
JAXBContext context= JAXBContext.newInstance(Profiles.class);
System.out.println("vijay123");

Unmarshaller um=context.createUnmarshaller();
System.out.println("vijay1234");

Profiles m= (Profiles) um.unmarshal(new StringReader(output));

System.out.println("vijay1");
System.out.println("Output from Serverrr .... \n");
System.out.println(m.getFirstname());
session.setAttribute("Profile", m);

System.out.println("Output from Serverrter saving the object");





%>
<div class="header"></div>
<div class="header1">
<%Profiles c=(Profiles)session.getAttribute("Profile"); %>
<div id="headertext" class="header1" >Welcome <%=c.getFirstname()+" "+c.getLastname() %> </div>
</div>

<div class="header3">
AdminPage  &nbsp;
<a href="logout.jsp" class="button">LOGOUT</a>
</div>




<div class="leftcolumn">
<table>
</br></br>
<a href="AddPost.jsp" class="button" method="post">AddPost</a>
<a href="ViewAllPosts.jsp" class="button" method="post">ViewAllPosts</a>
<a href="ViewAllMessages.jsp" class="button" method="post">ViewAllMessages</a>
<a href="SendMessage.jsp" class="button" method="post">SendMessage</a>
<a href="CreateProfileForm.jsp" class="button" method="post">CreateNewProfile</a>
<a href="DeleteProfile.jsp" class="button" method="post">DeleteProfile</a>
</table>
</div>
<div class="maincolumn">

hello every onefsdg
</div>



       

<%

}
catch(Exception e)
{
	System.out.println("exception"+e);
}




%>
</body>
</html>
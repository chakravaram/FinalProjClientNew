<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
Profiles c=(Profiles)session.getAttribute("Profile");
System.out.println("Output from Serverrter saving the object");





%>
<h2 align=center> Welcome <%=c.getFirstname()+" "+c.getLastname() %> </h2>


<form action="AddPost.jsp" method="post">
 <input type="submit" value="AddPost">
</form>


<form action="ViewAllPosts.jsp" method="post">
 <input type="submit" value="ViewAllPosts">
</form>

<form action="ViewAllMessages.jsp" method="post">
 <input type="submit" value="ViewAllMessages">
</form>
<form action="SendMessage.jsp" method="post">
 <input type="submit" value="SendMessage">
</form>
<form action="CreateProfileForm.jsp" method="post">
 <input type="submit" value="CreateProfile">
</form>

<form action="DeleteProfile.jsp" method="post">
 <input type="submit" value="DeleteProfile">
</form>


<br/>
            <br/>
            <br/><br/><br/><br/><br/>
        <a href="logout.jsp">Logout</a>

<%

}
catch(Exception e)
{
	System.out.println("exception"+e);
}




%>
</body>
</html>
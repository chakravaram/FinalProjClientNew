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
 				ksu.chakravaram.client.modelclasses.ValiedUser,

 				javax.xml.bind.JAXBContext,
				javax.xml.bind.Unmarshaller" %>

<% 
    String username=request.getParameter("username").trim(); 
	String password=request.getParameter("password").trim(); 
    Client client = Client.create();
     WebResource webResource = client
    .resource("http://localhost:8081/WebServices_Final1/backend/profiles/"+username+"/"+password);

     ClientResponse res = webResource.accept("application/xml")
     .get(ClientResponse.class);

 if (res.getStatus() != 200) {
    throw new RuntimeException("Failed : HTTP error code : "
 	+ response.getStatus());
 }

 try{
 	String output = res.getEntity(String.class);
 	System.out.println("vijay12");
 	  
 JAXBContext context= JAXBContext.newInstance(ValiedUser.class);
 System.out.println("vijay123");

 Unmarshaller um=context.createUnmarshaller();
 System.out.println("vijay1234");

 ValiedUser m= (ValiedUser) um.unmarshal(new StringReader(output));

 System.out.println("vijay1");
 System.out.println("Output from Serverrr .... \n");
 System.out.println(m.getProfile_id());
 
 if(m.getFlag()==0)
	 response.sendRedirect("LoginFail.jsp");
 else{
 System.out.println("login in success"+m.getProfile_id());
 session.setAttribute("pid", m.getProfile_id());
 if(username.equals("vijay") && password.equals("vijay"))
 {
	 session.setAttribute("role","admin");
	 session.setAttribute("aid",m.getProfile_id());
 response.sendRedirect("AdminHome.jsp");
 }
 else{
	 session.setAttribute("role","user");
	
	 response.sendRedirect("home.jsp");}
	 
 }
 
 }
 catch(Exception e)
 {
 	System.out.println("exception"+e);
 }

     
     
     
     %>



</body>
</html>
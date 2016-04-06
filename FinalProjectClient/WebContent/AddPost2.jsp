<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<script>
function goBack() {
    window.history.back();
}
</script>

</head>
<body>
<%@page import= "java.io.StringReader,
				ksu.chakravaram.client.modelclasses.SendPost,
				ksu.chakravaram.client.modelclasses. IntegerValue,
				com.sun.jersey.api.client.Client,
 				com.sun.jersey.api.client.ClientResponse,
 				com.sun.jersey.api.client.WebResource,
				javax.xml.bind.JAXBContext,
				javax.xml.bind.Unmarshaller "   %>
  
  
  
  
  
  <%
  
  String msg=request.getParameter("pmsg");
  String s=session.getAttribute("pid").toString();
  int a=Integer.parseInt(s);
  SendPost p=new SendPost();
  p.setPost(msg);
  p.setProfile_id(a);

  Client client = Client.create();
  WebResource webResource = client
  .resource("http://localhost:8081/WebServices_Final1/backend/profiles/newpost");

  ClientResponse res = webResource.type("application/xml")
  .post(ClientResponse.class,p);
  if (res.getStatus() != 200)
         {
  	    throw new RuntimeException("Failed : HTTP error code : "	+ response.getStatus());
  	    }

  try{
  	 	String output = res.getEntity(String.class); 		 	  
  	 JAXBContext context= JAXBContext.newInstance(IntegerValue.class);	 
  	 Unmarshaller um=context.createUnmarshaller();	
  	 IntegerValue m= (IntegerValue) um.unmarshal(new StringReader(output));
  	 int i=m.getI();	 
  	 if(i==1)
  	 {
  		// response.sendRedirect("ProfileCreated.jsp");
  	 %>
  	 Posted!!
  	 <%
  	 }
  	 else{
  	 
  		 //response.sendRedirect("ProfileCreationError.jsp");
  		 %>
  		 Sory error in Posting
  		 <%
  	 }
  	 
  	 %>
  	 
  	 <form action="home.jsp" method="post">
          <button  type="submit" >Home</button>
          </form>
  	 
  	 <%
  	 }
  	 
  	 
  	 catch(Exception e)
  	 {
  	 	System.out.println("exception"+e);
  	 }


  
  %>
</body>
</html>
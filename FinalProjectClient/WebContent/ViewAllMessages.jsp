<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Messages</title>
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
 				ksu.chakravaram.client.modelclasses.ListMessagess,
 				ksu.chakravaram.client.modelclasses.Messages,

 				javax.xml.bind.JAXBContext,
				javax.xml.bind.Unmarshaller" %>
<%Profiles c=(Profiles)session.getAttribute("Profile"); %>
<h2 align=center> Welcome <%=c.getFirstname()+" "+c.getLastname() %> </h2>
<h2 align="center"> Here are your messages</h2>
<%
Client client = Client.create();

String s=session.getAttribute("pid").toString();
int a=Integer.parseInt(s);

System.out.println("vijay12"+a);
WebResource webResource = client
 .resource("http://localhost:8081/WebServices_Final1/backend/profiles/messages/"+a);
System.out.println("vijay10");
ClientResponse res = webResource.accept("application/xml")
         .get(ClientResponse.class);

if (res.getStatus() != 200) {
 throw new RuntimeException("Failed : HTTP error code : "
	+ response.getStatus());
}

try{
	String output = res.getEntity(String.class);
	System.out.println("vijay12"+output);
	  
JAXBContext context= JAXBContext.newInstance(ListMessagess.class);
System.out.println("vijay123");

Unmarshaller um=context.createUnmarshaller();

	System.out.println("vij57");

ListMessagess m= (ListMessagess) um.unmarshal(new StringReader(output));

	System.out.println("vij5"+m);
	
	
	if(m.getMessages()==null)
	{
		%>
		
		You Don't have any Messages to Show!
		
		<%
		
	}
	
	else{
		
	

	for(Messages msg : m.getMessages())
	{
		System.out.println("vijay12345");
	    System.out.println(msg.getMessage());
	    System.out.println("vijay12346");
	    System.out.println(msg.getFrom_profile_id());
	    int mid=msg.getFrom_profile_id();
	    
	    %>
	        <h1>From : <%=msg.getFrom_profile_id()%></br>
	        <h1>
	        <a href="ViewProfile.jsp?id=<%=mid%>">
	       
	        click</a>
	        </h1>
	        Message: <%=msg.getMessage() %>
	        </h1>
	        
	    
	    <%
	}
    
	}  






System.out.println("vijay1");

}
catch(Exception e)
{
	System.out.println("exception"+e);
}



%>

</body>
</html>
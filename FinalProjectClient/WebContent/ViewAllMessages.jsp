<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Messages</title>
<link href="css/style1.css" rel='stylesheet' type='text/css'>
</head>
<body>
<%@page language="java" %> 
<%@page import= "java.io.StringReader,
                 java.util.ArrayList,
				 java.util.List,
                 ksu.chakravaram.client.DAO.DAO,
                 java.text.SimpleDateFormat,
 				com.sun.jersey.api.client.Client,
 				com.sun.jersey.api.client.ClientResponse,
 				java.io.FileOutputStream,
 				com.sun.jersey.api.client.WebResource,
 				ksu.chakravaram.client.modelclasses.Profiles,
 				ksu.chakravaram.client.modelclasses.ListMessagess,
 				ksu.chakravaram.client.modelclasses.Messages,

 				javax.xml.bind.JAXBContext,
				javax.xml.bind.Unmarshaller" %>
				
				
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


		
<table width="100%"  cellspacing="10">					
	
				

<%

Client client = Client.create();
DAO a1=new DAO();
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
	SimpleDateFormat sim = new SimpleDateFormat("EEE, MMM d,HH:mm a");
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
		<p><font size="6" color="#142170">You Don't have any Messages to Show!</font></p></br></br>
		
		
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
	    Profiles pf=a1.viewProfile(mid);
	    String date=sim.format(msg.getTime());
	    if(pf.getProfile_id()!=0)
	    {
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
		        
	<tr >
      <td width="70"> <image src="images/<%=mid %>.jpg" height="70" width="70"/>   </td> 
      
          <td width="100" align="center">  <a href="ViewProfile.jsp?id=<%=mid%>" > <%=pf.getFirstname().toUpperCase()+" "+pf.getLastname().toUpperCase()%> </a> </td>
          <td width="100"> <%=date %></td>
        
      <td><%=msg.getMessage() %></td>
      
      
    </tr>
       <%
        }//if

	        
	  }//for
    
	  }  //else






System.out.println("vijay1");

}
catch(Exception e)
{
	System.out.println("exception"+e);
}



%>
</table>
</div>

</body>
</html>
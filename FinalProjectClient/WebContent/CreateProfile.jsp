<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import= "java.io.StringReader,
ksu.chakravaram.client.modelclasses.Post,
ksu.chakravaram.client.modelclasses.ListPosts,
ksu.chakravaram.client.modelclasses.Profiles,
ksu.chakravaram.client.modelclasses. IntegerValue,

ksu.chakravaram.client.modelclasses.ProfilePost,
com.sun.jersey.api.client.Client,
 				com.sun.jersey.api.client.ClientResponse,
 				com.sun.jersey.api.client.WebResource,
java.util.Date,
java.text.SimpleDateFormat,
javax.xml.bind.JAXBContext,
				javax.xml.bind.Unmarshaller,
				java.io.FileInputStream,
                 java.io.File,
 				ksu.chakravaram.client.DAO.DAO"
%>

<%    
String d1=request.getParameter("dob");
System.out.println(d1);
SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");
String phno=request.getParameter("phno");
String path=request.getParameter("path");
Date date = formatter.parse(d1);


File file = new File("D:/LocalGitRepo/FinalProjectClient/FinalProjectClient/WebContent/images/"+path);
byte[] bFile = new byte[(int) file.length()];

try {
 FileInputStream fileInputStream = new FileInputStream(file);
 //convert file into array of bytes
 fileInputStream.read(bFile);
 fileInputStream.close();
} catch (Exception e) {
 e.printStackTrace();
}

	System.out.println(date+""+fname+""+lname+""+uname+""+pwd+""+phno+""+path);
	ProfilePost p=new ProfilePost();
	
	
	
	
	
	p.setDob(date);
	p.setFirstname(fname);
	p.setLastname(lname);
	p.setUsername(uname);
	p.setPassword(pwd);
	p.setPhno(phno);
	p.setImage(bFile);
	
	
	 Client client = Client.create();
     WebResource webResource = client
    .resource("http://localhost:8081/WebServices_Final1/backend/profiles/create");

     ClientResponse res = webResource.type("application/xml")
     .post(ClientResponse.class,p);
     if (res.getStatus() != 200) {
    	 
    	    throw new RuntimeException("Failed : HTTP error code : "
    	 	+ response.getStatus());
    	 }
    

     
     try{
    	 	String output = res.getEntity(String.class);
    	 	
    	 	  
    	 JAXBContext context= JAXBContext.newInstance(IntegerValue.class);
    	 

    	 Unmarshaller um=context.createUnmarshaller();
    	
    	 IntegerValue m= (IntegerValue) um.unmarshal(new StringReader(output));
    	 int i=m.getI();

    	
    	 
    	 if(i==1)
    		 response.sendRedirect("ProfileCreated.jsp");
    	 else
    	 
    		 response.sendRedirect("ProfileCreationError.jsp");
     }
    	 
    	 
    	 catch(Exception e)
    	 {
    	 	System.out.println("exception"+e);
    	 }
     
     
	
	

%>


</body>
</html>
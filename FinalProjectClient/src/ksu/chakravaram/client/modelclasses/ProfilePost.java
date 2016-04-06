package ksu.chakravaram.client.modelclasses;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement( name = "profiles")	
public class ProfilePost {

	public ProfilePost() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	@XmlElement
	private String firstname;
	@XmlElement
	private String lastname;
	@XmlElement
	private int phno;
	@XmlElement
	private Date dob;	
	@XmlElement
	private String username;
	@XmlElement
	private String password;
	
	

public void setFirstname(String firstname) {
	this.firstname = firstname;
}
public void setLastname(String lastname) {
	this.lastname = lastname;
}
public void setPhno(int phno) {
	this.phno = phno;
}
public void setDob(Date dob) {
	this.dob = dob;
}
public void setUsername(String username) {
	this.username = username;
}
public void setPassword(String password) {
	this.password = password;
}
	

}

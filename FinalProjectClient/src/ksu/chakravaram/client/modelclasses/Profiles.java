package ksu.chakravaram.client.modelclasses;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement( name = "profiles")	
public class Profiles {

	public Profiles() {
		// TODO Auto-generated constructor stub
	}

	
	
	
	

		
	
	@XmlElement
		private int profile_id;
	@XmlElement
		private String firstname;
	@XmlElement
		private String lastname;
	@XmlElement
		private String phno;
	@XmlElement
		private Date dob;
	@XmlElement
		
		private String username;
	@XmlElement
		private String password;
	@XmlElement
	byte[] image;
	
	public byte[] getImage() {
		return image;
	}

	public int getProfile_id() {
		return profile_id;
	}
	
	public String getFirstname() {
		return firstname;
	}
	
	public String getLastname() {
		return lastname;
	}
	
	public String getPhno() {
		return phno;
	}
	
	public Date getDob() {
		return dob;
	}
	
	public String getUsername() {
		return username;
	}
	
	public String getPassword() {
		return password;
	}
	
		
		
		
		

		
	}

	
	
	
	
	

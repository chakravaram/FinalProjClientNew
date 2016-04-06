package ksu.chakravaram.client.modelclasses;



import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement( name = "valiedUser")	
public class ValiedUser {

	public ValiedUser() {
		// TODO Auto-generated constructor stub
	}

	@XmlElement
	private int flag;
	@XmlElement
	private int profile_id;
	
	
	//change2
	
	public int getFlag() {
		return flag;
	}
	
	public int getProfile_id() {
		return profile_id;
	}
	
}

package ksu.chakravaram.client.modelclasses;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement( name = "messages")
public class SendMessage {

 
	@XmlElement
	private int from_profile_id;
	@XmlElement
	private String message;	
	@XmlElement
	private int to_profile_id;
	
	
	public void setFrom_profile_id(int from_profile_id) {
		this.from_profile_id = from_profile_id;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public void setTo_profile_id(int to_profile_id) {
		this.to_profile_id = to_profile_id;
	}
	
	
}

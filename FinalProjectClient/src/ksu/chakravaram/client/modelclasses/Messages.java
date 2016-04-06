package ksu.chakravaram.client.modelclasses;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement( name = "messages")	
public class Messages {

	public Messages() {
		// TODO Auto-generated constructor stub
	}

	@XmlElement
	private int tmsgs;
	@XmlElement
	private int from_profile_id;
	@XmlElement
	private String message;
	@XmlElement
	private int to_profile_id;
	@XmlElement
	private Date time;
	public int getFrom_profile_id() {
		return from_profile_id;
	}
	
	public String getMessage() {
		return message;
	}
	
	public int getTo_profile_id() {
		return to_profile_id;
	}
	public int getTmsgs() {
		return tmsgs;
	}
	
	
	public Date getTime() {
		return time;
	}
	

}

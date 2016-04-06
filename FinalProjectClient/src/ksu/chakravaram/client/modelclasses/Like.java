package ksu.chakravaram.client.modelclasses;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement( name = "likes")	
public class Like {

	public Like() {
		// TODO Auto-generated constructor stub
	}
	
	@XmlElement
	private int post_id;
	@XmlElement
	private int profile_id;
	public int getPost_id() {
		return post_id;
	}
	public int getProfile_id() {
		return profile_id;
	}

}

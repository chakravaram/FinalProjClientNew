package ksu.chakravaram.client.modelclasses;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement( name = "posts")	
public class SendPost {

	public SendPost() {
		// TODO Auto-generated constructor stub
	}

	@XmlElement
	private int profile_id;
	@XmlElement
	private String post;
	
	public void setProfile_id(int profile_id) {
		this.profile_id = profile_id;
	}
	public void setPost(String post) {
		this.post = post;
	}
	
	
	
}

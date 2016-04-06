package ksu.chakravaram.client.modelclasses;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement( name = "comments")
public class SendComment {

	public SendComment() {
		// TODO Auto-generated constructor stub
	}

	@XmlElement
	private int profile_id;
	@XmlElement
	private int post_id;
	@XmlElement
	private String cmt;
	public void setProfile_id(int profile_id) {
		this.profile_id = profile_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public void setCmt(String cmt) {
		this.cmt = cmt;
	}
	
	
}

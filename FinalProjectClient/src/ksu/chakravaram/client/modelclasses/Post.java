package ksu.chakravaram.client.modelclasses;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement( name = "posts")	
public class Post 
{
	@XmlElement
	private int post_id;
	@XmlElement
	private int profile_id;
	@XmlElement
	private String post;
	@XmlElement
	private Date time;
	
	
	public int getPost_id() {
		return post_id;
	}
	
	public int getProfile_id() {
		return profile_id;
	}
	
	public String getPost() {
		return post;
	}
	
	public Date getTime() {
		return time;
	}
	
}

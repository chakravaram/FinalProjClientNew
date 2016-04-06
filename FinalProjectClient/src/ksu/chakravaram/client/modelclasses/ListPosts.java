package ksu.chakravaram.client.modelclasses;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "postss")
public class ListPosts {

	
	
	

	@XmlElement(name = "posts")
    private List<Post> posts;

	public List<Post> getPosts() {
		return posts;
	}
	
	

}

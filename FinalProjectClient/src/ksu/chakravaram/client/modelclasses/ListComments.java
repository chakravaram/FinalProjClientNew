package ksu.chakravaram.client.modelclasses;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "commentss")
public class ListComments {

	public ListComments() {
		// TODO Auto-generated constructor stub
	}
	
	
	public List<Comments> getCmts() {
		return cmts;
	}


	@XmlElement(name = "comments")
	private List<Comments> cmts;

}

package ksu.chakravaram.client.modelclasses;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "likess")
public class ListLikes {

	@XmlElement(name = "likes")
	private List<Like> likes;

	public List<Like> getLikes() {
		return likes;
	}

	
}

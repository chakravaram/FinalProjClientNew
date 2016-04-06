package ksu.chakravaram.client.modelclasses;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "profiless")
public class ListProfiles {

	

	@XmlElement(name = "profiles")
	private List<Profiles> profiles;

	public List<Profiles> getProfiles() {
		return profiles;
	}
	
}

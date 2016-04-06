package ksu.chakravaram.client.modelclasses;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "messagess")
public class ListMessagess {
	
	@XmlElement(name = "messages")
    private List<Messages> messages;

	public List<Messages> getMessages() {
		return messages;
	}

	
	

}

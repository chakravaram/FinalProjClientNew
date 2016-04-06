package ksu.chakravaram.client.modelclasses;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "integerResponse")
public class IntegerValue {

	public IntegerValue() {
		// TODO Auto-generated constructor stub
	}
	@XmlElement(name = "i")
	private int i;
	public int getI() {
		return i;
	}
	
	

}




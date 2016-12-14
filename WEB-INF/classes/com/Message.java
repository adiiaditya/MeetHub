package com;

import java.util.*;

public class Message {

	Integer id;
	String fromEmailID;
	String toEmailID;
	String fromUser;
	String messageText;
	Date sentOn;


	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}


	public void setFromEmailID(String fromEmailID) {
		this.fromEmailID = fromEmailID;
	}

	public String getFromEmailID() {
		return fromEmailID;
	}


	public void setToEmailID(String toEmailID) {
		this.toEmailID = toEmailID;
	}

	public String getToEmailID() {
		return toEmailID;
	}


	public void setFromUser(String fromUser) {
		this.fromUser = fromUser;
	}

	public String getFromUser() {
		return fromUser;
	}

	public void setMessageText(String messageText) {
		this.messageText = messageText;
	}

	public String getMessageText() {
		return messageText;
	}

	public void setSentOn(Date sentOn) {
		this.sentOn = sentOn;
	}

	public Date getSentOn() {
		return sentOn;
	}

}

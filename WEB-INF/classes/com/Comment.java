package com;

import java.io.Serializable;

public class Comment implements Serializable{

	private String comment;
	private String email;
	private String status;
	
	
	public Comment(){
		
	}
	
	public Comment(String comment, String email,String status) {
		super();
		this.comment = comment;
		this.email = email;
		this.status=status;
	}
	
	@Override
	public boolean equals(Object object) {
		boolean result = false;
		if (object == null || object.getClass() != getClass()) {
			result = false;
		} else {
			Comment comment = (Comment) object;
			if (this.comment.equals(comment.getComment())
					&& this.email.equals(comment.getEmail()) &&
					this.status.equals(comment.getStatus())) {
				result = true;
			}
		}
		return result;
	}
	
	@Override
	public int hashCode() {
		int hash = 3;
		hash = 7 * hash + this.comment.hashCode();
		hash = 7 * hash + this.email.hashCode();
		hash = 7 * hash + this.status.hashCode();
		return hash;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}

package com;
import java.util.ArrayList;
import java.util.List;

public class Status {
  public String email;
  public String status;
  public String date;
  public int likes;

	public void setEmail(String email) {
		this.email = email;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

  public String getEmail() {
      return email;
  }

  public String getStatus() {
      return status;
  }

  public String getDate() {
      return date;
  }

  public int getLikes() {
		return likes;
	}
}

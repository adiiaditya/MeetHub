package com;
import java.util.ArrayList;
import java.util.List;

public class User {
  public String name;
  public String email;
  public String password;
  public String profilepic;
  public String coverpic;
  public String university;
  public String dateofbirth;
  public String major;
  public String city;
  public String joindate;
  public String leavingdate;
  public String gender;
  public String phone;

	public void setFullName(String name) {
		this.name = name;
	}

	public void setUserEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setProfilePic(String profilepic) {
		this.profilepic = profilepic;
	}

	public void setCoverPic(String coverpic) {
		this.coverpic = coverpic;
	}

	public void setUserUniversity(String university) {
		this.university = university;
	}

	public void setUserDOB(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public void setUserMajor(String major) {
		this.major = major;
	}

	public void setUserCity(String city) {
		this.city = city;
	}

	public void setJoinDate(String joindate) {
		this.joindate = joindate;
	}

	public void setLeavingDate(String leavingdate) {
		this.leavingdate = leavingdate;
	}

	public void setUserGender(String gender) {
		this.gender = gender;
	}

	public void setUserPhone(String phone) {
		this.phone = phone;
	}

  public String getFullName() {
      return name;
  }

  public String getUserEmail() {
      return email;
  }

  public String getProfilePic() {
      return profilepic;
  }

  public String getCoverPic() {
      return coverpic;
  }

  public String getUserUniversity() {
		return university;
	}

	public String getUserDOB() {
		return dateofbirth;
	}

	public String getUserMajor() {
		return major;
	}

	public String getUserCity() {
		return city;
	}

	public String getJoinDate() {
		return joindate;
	}

	public String getLeavingDate() {
		return leavingdate;
	}

	public String getUserGender() {
		return gender;
	}

	public String getUserPhone() {
		return phone;
	}
}

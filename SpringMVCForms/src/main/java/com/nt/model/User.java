package com.nt.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import lombok.Data;

@Data
public class User {

	@NotNull
	@Size(min = 2, max = 30, message = "first name should mandatory")
	private String fname;

	@NotNull
	@Size(min = 2, max = 30, message = "last name should mandatory")
	private String lname;

	@NotEmpty
	@Email(message = "provide valid email")
	private String email;

	@NotEmpty
	@Size(min = 5, max = 10, message = "password should have between {min} and {max} characters")

	private String pwd;

	@NotNull
	@Size(min = 5, max = 10, message = "password should not match")

	private String confirmPwd;

	@NotEmpty(message = "please mention the gender")
	private String genders;

	@NotEmpty(message = "timings are not empty")
	private String timings;

	@NotEmpty(message = "please mention atleat one course")
	private String courses;

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getGenders() {
		return genders;
	}

	public void setGenders(String genders) {
		this.genders = genders;
	}

	public String getTimings() {
		return timings;
	}

	public void setTimings(String timings) {
		this.timings = timings;
	}

	public String getCourses() {
		return courses;
	}

	public void setCourses(String courses) {
		this.courses = courses;
	}

	public String getConfirmPwd() {
		return confirmPwd;
	}

	public void setConfirmPwd(String confirmPwd) {
		this.confirmPwd = confirmPwd;
	}

	@Override
	public String toString() {
		return "User [fname=" + fname + ", lname=" + lname + ", email=" + email + ", pwd=" + pwd + ", confirmPwd="
				+ confirmPwd + ", genders=" + genders + ", timings=" + timings + ", courses=" + courses + "]";
	}

}

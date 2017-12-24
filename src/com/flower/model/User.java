package com.flower.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="users")
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;

	@Column(name="userName",length=30)
	private String userName;
	
	@Column(name="realName",length=30)
	private String realName;
	
	@Column(name="password",length=30)
	private String password;
	
	@Transient
	private String passwordConfirm;
	
	@Column(name="pwdQuestion",length=50)
	private String pwdQuestion;
	
	@Column(name="pwdQuestionAnswer",length=50)
	private String pwdQuestionAnswer;
	
	@Column(name="address",length=50)
	private String address;
	
	@Column(name="phoneNO",length=30)
	private String phoneNO;
	
	@Column(name="email",length=50)
	private String email;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	public String getPwdQuestion() {
		return pwdQuestion;
	}

	public void setPwdQuestion(String pwdQuestion) {
		this.pwdQuestion = pwdQuestion;
	}

	public String getPwdQuestionAnswer() {
		return pwdQuestionAnswer;
	}

	public void setPwdQuestionAnswer(String pwdQuestionAnswer) {
		this.pwdQuestionAnswer = pwdQuestionAnswer;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNO() {
		return phoneNO;
	}

	public void setPhoneNO(String phoneNO) {
		this.phoneNO = phoneNO;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", realName=" + realName + ", password=" + password
				+ ", pwdQuestion=" + pwdQuestion + ", pwdQuestionAnswer=" + pwdQuestionAnswer + ", address=" + address
				+ ", phoneNO=" + phoneNO + ", email=" + email + "]";
	}
	
}

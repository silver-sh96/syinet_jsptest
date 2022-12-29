package com.test.esh.dto;

public class UserDTO {
	
	private String userId;
	private String userPw;
	private String userFirstName;
	private String userMiddleName;
	private String userName;
	private String userDept;
	private String userPosition;
	private String userRank;
	private String userPhone;
	private String userHomePhone;
	private String userZipCode;
	private String userAddr;
	private String userAddrDetail;
	private String userEmail;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserFirstName() {
		return userFirstName;
	}
	public void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}
	public String getUserMiddleName() {
		return userMiddleName;
	}
	public void setUserMiddleName(String userMiddleName) {
		this.userMiddleName = userMiddleName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserDept() {
		return userDept;
	}
	public void setUserDept(String userDept) {
		this.userDept = userDept;
	}
	public String getUserPosition() {
		return userPosition;
	}
	public void setUserPosition(String userPosition) {
		this.userPosition = userPosition;
	}
	public String getUserRank() {
		return userRank;
	}
	public void setUserRank(String userRank) {
		this.userRank = userRank;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserHomePhone() {
		return userHomePhone;
	}
	public void setUserHomePhone(String userHomePhone) {
		this.userHomePhone = userHomePhone;
	}
	public String getUserZipCode() {
		return userZipCode;
	}
	public void setUserZipCode(String userZipCode) {
		this.userZipCode = userZipCode;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserAddrDetail() {
		return userAddrDetail;
	}
	public void setUserAddrDetail(String userAddrDetail) {
		this.userAddrDetail = userAddrDetail;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	@Override
	public String toString() {
		return "UserDTO [userId=" + userId + ", userPw=" + userPw + ", userFirstName=" + userFirstName
				+ ", userMiddleName=" + userMiddleName + ", userName=" + userName + ", userDept=" + userDept
				+ ", userPosition=" + userPosition + ", userRank=" + userRank + ", userPhone=" + userPhone
				+ ", userHomePhone=" + userHomePhone + ", userZipCode=" + userZipCode + ", userAddr=" + userAddr
				+ ", userAddrDetail=" + userAddrDetail + ", userEmail=" + userEmail + "]";
	}
	
}

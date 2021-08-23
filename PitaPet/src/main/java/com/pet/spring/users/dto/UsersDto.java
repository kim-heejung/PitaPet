package com.pet.spring.users.dto;

public class UsersDto {
	private String id;
	private String pwd;
	private String name;
	private String phoneNumber;
	private String birth;
	private String address;
	private String household;
	private String email;
	private String profile;
	private String regdate;
	private int donation;
	private int groupNum;
	
	//디폴트 생성자
	public UsersDto() {}

	public UsersDto(String id, String pwd, String name, String phoneNumber, String birth, String address,
			String household, String email, String profile, String regdate, int donation, int groupNum) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.birth = birth;
		this.address = address;
		this.household = household;
		this.email = email;
		this.profile = profile;
		this.regdate = regdate;
		this.donation = donation;
		this.groupNum = groupNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHousehold() {
		return household;
	}

	public void setHousehold(String household) {
		this.household = household;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getDonation() {
		return donation;
	}

	public void setDonation(int donation) {
		this.donation = donation;
	}

	public int getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	
	
	
}

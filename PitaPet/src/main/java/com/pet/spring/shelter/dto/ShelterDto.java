package com.pet.spring.shelter.dto;

public class ShelterDto {
	private int num;
	private String serialNum;
	private String id;
	private String name;
	private String email;
	private String phoneNumber;
	private String address;
	private String regdate;
	private String longitude;
	private String latitude;
	
	public ShelterDto() {}


	public ShelterDto(int num, String serialNum, String id, String name, String email, String phoneNumber,
			String address, String regdate, String longitude, String latitude) {
		super();
		this.num = num;
		this.serialNum = serialNum;
		this.id = id;
		this.name = name;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.regdate = regdate;
		this.longitude = longitude;
		this.latitude = latitude;
	}


	public String getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(String serialNum) {
		this.serialNum = serialNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}



	public String getLongitude() {
		return longitude;
	}



	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}



	public String getLatitude() {
		return latitude;
	}



	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}

	
	
	
}

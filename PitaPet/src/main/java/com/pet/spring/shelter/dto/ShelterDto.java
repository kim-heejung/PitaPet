package com.pet.spring.shelter.dto;

public class ShelterDto {
	private int serialNum;
	private String id;
	private String name;
	private String email;
	private String address;
	private String regdate;
	
	public ShelterDto() {}

	public ShelterDto(int serialNum, String id, String name, String email, String address, String regdate) {
		super();
		this.serialNum = serialNum;
		this.id = id;
		this.name = name;
		this.email = email;
		this.address = address;
		this.regdate = regdate;
	}

	public int getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(int serialNum) {
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
	
	
}

package com.pet.spring.adopt.dto;

public class ReserveDto {
	
	private int num;
	private String id;
	private String shelterName;
	private String title;
	private String name;
	private String phoneNumber;
	private String reservedDate;
	private String reservedTime;
	private int viewCount;
	private int startRowNum;
	private int endRowNum;
	
	public ReserveDto() {}

	public ReserveDto(int num, String id, String shelterName, String title, String name, String phoneNumber,
			String reservedDate, String reservedTime, int viewCount, int startRowNum, int endRowNum) {
		super();
		this.num = num;
		this.id = id;
		this.shelterName = shelterName;
		this.title = title;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.reservedDate = reservedDate;
		this.reservedTime = reservedTime;
		this.viewCount = viewCount;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getShelterName() {
		return shelterName;
	}

	public void setShelterName(String shelterName) {
		this.shelterName = shelterName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getReservedDate() {
		return reservedDate;
	}

	public void setReservedDate(String reservedDate) {
		this.reservedDate = reservedDate;
	}

	public String getReservedTime() {
		return reservedTime;
	}

	public void setReservedTime(String reservedTime) {
		this.reservedTime = reservedTime;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
	
}

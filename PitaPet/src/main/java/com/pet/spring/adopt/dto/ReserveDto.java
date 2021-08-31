package com.pet.spring.adopt.dto;

public class ReserveDto {
	
	private int num;
	private String shelterName;
	private String title;
	private String writer;
	private String reservedDate;
	private String reservedTime;
	private String name;
	private String phoneNumber;
	private String content;
	private String regdate;
	private int viewCount;
	private int startRowNum;
	private int endRowNum;
	
	public ReserveDto() {}

	public ReserveDto(int num, String shelterName, String title, String writer, String reservedDate,
			String reservedTime, String name, String phoneNumber, String content, String regdate, int viewCount,
			int startRowNum, int endRowNum) {
		super();
		this.num = num;
		this.shelterName = shelterName;
		this.title = title;
		this.writer = writer;
		this.reservedDate = reservedDate;
		this.reservedTime = reservedTime;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.content = content;
		this.regdate = regdate;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
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

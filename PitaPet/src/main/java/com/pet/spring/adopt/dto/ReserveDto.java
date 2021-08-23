package com.pet.spring.adopt.dto;

public class ReserveDto {
	
	private int num;
	private String writer;
	private String reservedDate;
	private String reservedTime;
	private int startRowNum;
	private int endRowNum;
	
	public ReserveDto(int num, String writer, String reservedDate, String reservedTime, int startRowNum,
			int endRowNum) {
		super();
		this.num = num;
		this.writer = writer;
		this.reservedDate = reservedDate;
		this.reservedTime = reservedTime;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

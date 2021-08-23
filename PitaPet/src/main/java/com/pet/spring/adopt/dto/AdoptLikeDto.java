package com.pet.spring.adopt.dto;

public class AdoptLikeDto {

	private int num;
	private String id;
	private String bookmark;
	
	public AdoptLikeDto(int num, String id, String bookmark) {
		super();
		this.num = num;
		this.id = id;
		this.bookmark = bookmark;
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

	public String getBookmark() {
		return bookmark;
	}

	public void setBookmark(String bookmark) {
		this.bookmark = bookmark;
	}
	
}

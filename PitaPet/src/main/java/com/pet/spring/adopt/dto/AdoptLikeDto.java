package com.pet.spring.adopt.dto;

public class AdoptLikeDto {

	private int num;
	private String id;
	private String liked;
	private int cnt;
	
	public AdoptLikeDto() {}

	public AdoptLikeDto(int num, String id, String liked, int cnt) {
		super();
		this.num = num;
		this.id = id;
		this.liked = liked;
		this.cnt = cnt;
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

	public String getLiked() {
		return liked;
	}

	public void setLiked(String liked) {
		this.liked = liked;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}

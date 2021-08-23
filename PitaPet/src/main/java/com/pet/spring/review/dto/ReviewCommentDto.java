package com.pet.spring.review.dto;

public class ReviewCommentDto {
	private int num;
	private String id;
	private String content;
	private String target_nick;
	private int ref_group;
	private int comment_group;
	private String deleted;
	private String regdate;
	private String profile;
	private int startRowNum;
	private int endRowNum;
	
	public ReviewCommentDto() {}

	public ReviewCommentDto(int num, String id, String content, String target_nick, int ref_group, int comment_group,
			String deleted, String regdate, String profile, int startRowNum, int endRowNum) {
		super();
		this.num = num;
		this.id = id;
		this.content = content;
		this.target_nick = target_nick;
		this.ref_group = ref_group;
		this.comment_group = comment_group;
		this.deleted = deleted;
		this.regdate = regdate;
		this.profile = profile;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTarget_nick() {
		return target_nick;
	}

	public void setTarget_nick(String target_nick) {
		this.target_nick = target_nick;
	}

	public int getRef_group() {
		return ref_group;
	}

	public void setRef_group(int ref_group) {
		this.ref_group = ref_group;
	}

	public int getComment_group() {
		return comment_group;
	}

	public void setComment_group(int comment_group) {
		this.comment_group = comment_group;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
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

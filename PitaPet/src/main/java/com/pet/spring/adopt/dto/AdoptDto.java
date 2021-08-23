package com.pet.spring.adopt.dto;

import org.springframework.web.multipart.MultipartFile;

public class AdoptDto {
	
	private int num;
	private String writer;
	private String breed;
	private String petName;
	private int petAge;
	private String petGender; 
	private String neutralization;
	private String findDate;
	private String caption;
	private String imagePath;
	private String regdate;
	private int startRowNum;
	private int endRowNum;
	private int prevNum;
	private int nextNum; 
	private MultipartFile image; //이미지 파일 업로드 처리를 위한 필드
	
	public AdoptDto(int num, String writer, String breed, String petName, int petAge, String petGender,
			String neutralization, String findDate, String caption, String imagePath, String regdate, int startRowNum,
			int endRowNum, int prevNum, int nextNum, MultipartFile image) {
		super();
		this.num = num;
		this.writer = writer;
		this.breed = breed;
		this.petName = petName;
		this.petAge = petAge;
		this.petGender = petGender;
		this.neutralization = neutralization;
		this.findDate = findDate;
		this.caption = caption;
		this.imagePath = imagePath;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
		this.image = image;
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

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public int getPetAge() {
		return petAge;
	}

	public void setPetAge(int petAge) {
		this.petAge = petAge;
	}

	public String getPetGender() {
		return petGender;
	}

	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}

	public String getNeutralization() {
		return neutralization;
	}

	public void setNeutralization(String neutralization) {
		this.neutralization = neutralization;
	}

	public String getFindDate() {
		return findDate;
	}

	public void setFindDate(String findDate) {
		this.findDate = findDate;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
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

	public int getPrevNum() {
		return prevNum;
	}

	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}

	public int getNextNum() {
		return nextNum;
	}

	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}
	
}

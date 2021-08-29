package com.pet.spring.adopt.dto;

import org.springframework.web.multipart.MultipartFile;

public class AdoptDto {
	
	private int num;
	private String writer;
	private String title;
	private String breed;
	private String petName;
	private String petAge;
	private String petGender; 
	private String vaccination;
	private String neutralization;
	private String findDate;
	private String caption;
	private String imagePath;
	private String regdate;
	private int viewCount;
	private int startRowNum;
	private int endRowNum;
	private int prevNum;
	private int nextNum; 
	private MultipartFile image; //이미지 파일 업로드 처리를 위한 필드
	private String name;
	
	public AdoptDto() {}

	public AdoptDto(int num, String writer, String title, String breed, String petName, String petAge, String petGender,
			String vaccination, String neutralization, String findDate, String caption, String imagePath,
			String regdate, int viewCount, int startRowNum, int endRowNum, int prevNum, int nextNum,
			MultipartFile image, String name) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.breed = breed;
		this.petName = petName;
		this.petAge = petAge;
		this.petGender = petGender;
		this.vaccination = vaccination;
		this.neutralization = neutralization;
		this.findDate = findDate;
		this.caption = caption;
		this.imagePath = imagePath;
		this.regdate = regdate;
		this.viewCount = viewCount;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
		this.image = image;
		this.name = name;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getPetAge() {
		return petAge;
	}

	public void setPetAge(String petAge) {
		this.petAge = petAge;
	}

	public String getPetGender() {
		return petGender;
	}

	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}

	public String getVaccination() {
		return vaccination;
	}

	public void setVaccination(String vaccination) {
		this.vaccination = vaccination;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}

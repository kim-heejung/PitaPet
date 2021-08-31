package com.pet.spring.shop.dto;

import org.springframework.web.multipart.MultipartFile;

public class ShopDto {
	private int num;
	private String name;
	private int price;
	private int remainCount;
	private String category;
	private String id;
	private String imgPath;
	private MultipartFile image;
	private int startRowNum;
	private int endRowNum;
	
	public ShopDto() {}

	public ShopDto(int num, String name, int price, int remainCount, String category, String id, String imgPath,
			MultipartFile image, int startRowNum, int endRowNum) {
		super();
		this.num = num;
		this.name = name;
		this.price = price;
		this.remainCount = remainCount;
		this.category = category;
		this.id = id;
		this.imgPath = imgPath;
		this.image = image;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getRemainCount() {
		return remainCount;
	}

	public void setRemainCount(int remainCount) {
		this.remainCount = remainCount;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
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

package com.pet.spring.shop.dao;

import java.util.List;

import com.pet.spring.shop.dto.ShopDto;

public interface ShopDao {
	public void insert(ShopDto dto);
	public List<ShopDto> getList(ShopDto dto);
	public int getCount();
	public void minusCount(int num);
	public int getPrice(int num);
}

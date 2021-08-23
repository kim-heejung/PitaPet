package com.pet.spring.adopt.dao;

import java.util.List;

import com.pet.spring.adopt.dto.AdoptDto;

public interface AdoptDao {

	public List<AdoptDto> getList(AdoptDto dto);
	public int getCount(AdoptDto dto);
	public AdoptDto getData(AdoptDto dto);
	public void addViewCount(int num);
	public void insert(AdoptDto dto);
	public void update(AdoptDto dto);
	public void delete(int num);
	
}

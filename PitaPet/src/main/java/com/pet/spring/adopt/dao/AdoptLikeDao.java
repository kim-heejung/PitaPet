package com.pet.spring.adopt.dao;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.pet.spring.adopt.dto.AdoptLikeDto;

public interface AdoptLikeDao {

	public List<AdoptLikeDto> getYCountList();
	//public List<AdoptLikeDto> getYList(String id);
	public void insert(AdoptLikeDto dto);
	public void updateY(AdoptLikeDto dto);
	public void updateN(AdoptLikeDto dto);
	public AdoptLikeDto getData(AdoptLikeDto dto);
	public List<AdoptLikeDto> getMyList(String id);
	public int getCount(int num);
	public int isExist(AdoptLikeDto dto);
	
}

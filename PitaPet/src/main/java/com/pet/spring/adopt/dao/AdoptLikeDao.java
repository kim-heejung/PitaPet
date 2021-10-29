package com.pet.spring.adopt.dao;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.pet.spring.adopt.dto.AdoptLikeDto;

public interface AdoptLikeDao {

	public int isExist(AdoptLikeDto dto);
	public void insert(AdoptLikeDto dto);
	public void updateY(AdoptLikeDto dto);
	public void updateN(AdoptLikeDto dto);
	public List<AdoptLikeDto> getCountList();
	//public List<AdoptLikeDto> getMyList(String id);
	public AdoptLikeDto getData(AdoptLikeDto dto);
	public int getCount(int num);
	
}

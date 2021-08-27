package com.pet.spring.adopt.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;

import com.pet.spring.adopt.dto.AdoptLikeDto;

public interface AdoptLikeService {

	public void insert(HttpServletRequest request);
	
	//좋아요 클릭 시 (liked가 yes 일 때)
	public Map<String, Object> updateY(HttpServletRequest request);
	
	//좋아요 해제 시 (liked가 no 일 때)
	public Map<String, Object> updateN(HttpServletRequest request);
	
	public List<AdoptLikeDto> getYCountList();
	//테스트용
	public List<AdoptLikeDto> testGetYCountList(HttpServletRequest request);
	
	//테스트용
	//public List<AdoptLikeDto> testGetYList(HttpSession session);
	
	public AdoptLikeDto getData(HttpServletRequest request);
	//테스트용
	public void testGetData(HttpServletRequest request);
	
	public Map<String, Object> getCount(int num);
	
	public List<AdoptLikeDto> getMyList(HttpSession session);
}

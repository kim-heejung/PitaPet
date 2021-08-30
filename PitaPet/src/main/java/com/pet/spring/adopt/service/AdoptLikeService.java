package com.pet.spring.adopt.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;

import com.pet.spring.adopt.dto.AdoptLikeDto;

public interface AdoptLikeService {
	
	public void insert(HttpServletRequest request);
	
	public Map<String, Object> updateY(HttpServletRequest request);
	//좋아요 클릭 시 (liked가 yes 일 때)
	public void testUpdateY(HttpServletRequest request);
	
	//좋아요 해제 시 (liked가 no 일 때)
	public Map<String, Object> updateN(HttpServletRequest request);
	
	public List<AdoptLikeDto> getYCountList();
	//테스트용-후에 삭제될 부분
	public List<AdoptLikeDto> testGetYCountList(HttpServletRequest request);
	
	public AdoptLikeDto getData(HttpServletRequest request); 
	
	public Map<String, Object> getCount(int num);
	//테스트용-후에 삭제될 부분
	public int getTestCount(int num);
	
	public int isExist(HttpServletRequest request);

}

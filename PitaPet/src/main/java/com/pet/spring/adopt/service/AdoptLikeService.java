package com.pet.spring.adopt.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pet.spring.adopt.dto.AdoptLikeDto;

public interface AdoptLikeService {
	
	//아이디별 해당 게시글에 좋아요 insert 됐는지 확인용
	public int isExist(HttpServletRequest request);
	public void likeInsert(HttpServletRequest request);
	//public Map<String, Object> apiLikeInsert(HttpServletRequest request);
	//좋아요 재등록(수정)
	public Map<String, Object> likeUpdateY(HttpServletRequest request);
	//public void apiLikeUpdateY(HttpServletRequest request);
	//좋아요 취소
	public void likeUpdateN(HttpServletRequest request);
	//게시글 전체의 좋아요 갯수
	//public List<AdoptLikeDto> likeCountList();
	//public List<AdoptLikeDto> apiLikeCountList(HttpServletRequest request);
	//아이디별 해당 게시글의 좋아요 여부
	public AdoptLikeDto likeGetData(HttpServletRequest request); 
	//해당 게시글의 좋아요 갯수
	public int likeCount(int num);
	//public Map<String, Object> apiLikeCount(int num);

}

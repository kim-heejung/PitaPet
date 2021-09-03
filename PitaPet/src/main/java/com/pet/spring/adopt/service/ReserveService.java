package com.pet.spring.adopt.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.pet.spring.adopt.dto.ReserveCommentDto;
import com.pet.spring.adopt.dto.ReserveDto;
import com.pet.spring.shelter.dto.ShelterDto;

public interface ReserveService {

	public List<ReserveDto> getList(HttpServletRequest request);
	//테스트용-후에 삭제될 부분
	public List<ReserveDto> testGetList(HttpServletRequest request);
	
	public Map<String, Object> getListPaging(int pageNum);
	
	public Map<String, Object> insert(ReserveDto dto, HttpServletRequest request);

	public ReserveDto getDetail(HttpServletRequest request); 
	
	public Map<String, Object> update(ReserveDto dto);
   
	public Map<String, Object> delete(int num);
	
	//댓글 리스트
	public List<ReserveCommentDto> moreCommentList(HttpServletRequest request);
	//테스트용-후에 삭제될 부분
	public void testMoreCommentList(HttpServletRequest request);// 댓글 추가 응답
	
	public Map<String, Object> saveComment(HttpServletRequest request);// 댓글 저장
	public void testSaveComment(HttpServletRequest request);// 댓글 저장

	public Map<String, Object> deleteComment(HttpServletRequest request);// 댓글 삭제

	public Map<String, Object> updateComment(ReserveCommentDto dto);// 댓글 수정
	
	public List<ShelterDto> getCheckedList();
	
	public Map<String, Object> getCheckedY(HttpServletRequest request);
	
	public Map<String, Object> getCheckedN(HttpServletRequest request);
	
	public List<ReserveCommentDto> getAllCount();
	
	public Map<String, Object> detailCheck(int num, String pwd);

	
	
  
}

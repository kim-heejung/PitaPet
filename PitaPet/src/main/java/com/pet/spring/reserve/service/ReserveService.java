package com.pet.spring.reserve.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pet.spring.reserve.dto.ReserveCommentDto;
import com.pet.spring.reserve.dto.ReserveDto;
import com.pet.spring.shelter.dto.ShelterDto;

public interface ReserveService {

	public List<ReserveDto> apiGetList(HttpServletRequest request);
	//public List<ReserveDto> getList(HttpServletRequest request);
	public Map<String, Object> apiPaging(HttpServletRequest request);
	public Map<String, Object> addViewCount (int num);
	public void privatePwd(int num, String pwd, HttpServletRequest request);
	public ReserveDto getDetail(HttpServletRequest request); 
	//관리자-예약 확정 관리
	//지점별 관리자 아이디
	public List<ShelterDto> apiShelterList();
	//예약 확정
	public Map<String, Object> apiReserveY(HttpServletRequest request);
	//예약 취소
	public Map<String, Object> apiReserveN(HttpServletRequest request);
	public void insert(ReserveDto dto, HttpServletRequest request);
	public void update(ReserveDto dto);
	public void delete(int num);
	
	//댓글
	public void commentList(HttpServletRequest request);
	//public List<ReserveCommentDto> apiCommentList(HttpServletRequest request);
	public void insertComment(HttpServletRequest request);
	//public Map<String, Object> apiInsertComment(HttpServletRequest request);
	public void updateComment(ReserveCommentDto dto);
	public void deleteComment(HttpServletRequest request);
	//전체 게시글에 달린 댓글 갯수
	public List<ReserveCommentDto> getAllCount();

}

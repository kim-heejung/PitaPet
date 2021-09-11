package com.pet.spring.review.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pet.spring.review.dto.ReviewCommentDto;
import com.pet.spring.review.dto.ReviewDto;

public interface ReviewService {
	public void getList(HttpServletRequest request);
	public List<ReviewDto> getList2(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	public void getData(HttpServletRequest request);
	//게시글
	public void saveContent(ReviewDto dto, HttpServletRequest request);
	public void updateContent(ReviewDto dto);
	public void deleteContent(int num, HttpServletRequest request);
	//댓글
	public Map<String, Object> saveComment(HttpServletRequest request);
	public void updateComment(ReviewCommentDto dto);
	public void deleteComment(HttpServletRequest request);
	public List<ReviewCommentDto> moreCommentList(HttpServletRequest request);
	//댓글 페이징
	public Map<String, Object> commentPaging(HttpServletRequest request);
	//메인 노출
	public List<ReviewDto> mainList(HttpServletRequest request);
}

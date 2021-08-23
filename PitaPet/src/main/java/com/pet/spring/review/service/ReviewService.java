package com.pet.spring.review.service;

import javax.servlet.http.HttpServletRequest;

import com.pet.spring.review.dto.ReviewCommentDto;
import com.pet.spring.review.dto.ReviewDto;

public interface ReviewService {
	public void getList(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	public void getData(HttpServletRequest request);
	//게시글
	public void saveContent(ReviewDto dto, HttpServletRequest request);
	public void updateContent(ReviewDto dto);
	public void deleteContent(int num, HttpServletRequest request);
	//댓글
	public void saveComment(HttpServletRequest request);
	public void updateComment(ReviewCommentDto dto);
	public void deleteComment(HttpServletRequest request);
	public void moreCommentList(HttpServletRequest request);
	
}

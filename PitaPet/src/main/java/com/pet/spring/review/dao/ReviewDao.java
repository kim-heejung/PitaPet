package com.pet.spring.review.dao;

import java.util.List;

import com.pet.spring.review.dto.ReviewDto;

public interface ReviewDao {
	//게시글 목록
	public List<ReviewDto> getList(ReviewDto dto);
	//모든 게시글의 갯수
	public int getCount(ReviewDto dto);
	//한개의 게시글 정보
	public ReviewDto getData(int num);
	public ReviewDto getData(ReviewDto dto);
	//조회수 증가
	public void addViewCount(int num);
	//게시글(추가)
	public void insert(ReviewDto dto);
	//게시글(수정)
	public void update(ReviewDto dto);
	//게시글(삭제)
	public void delete(int num);
	//메인 노출
	public List<ReviewDto> mainList(ReviewDto dto);

}

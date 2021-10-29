package com.pet.spring.reserve.dao;

import java.util.List;

import com.pet.spring.reserve.dto.ReserveCommentDto;


public interface ReserveCommentDao {

	public List<ReserveCommentDto> getList(ReserveCommentDto dto);
	public int getCount(int ref_group);
	public int getSequence();
	public void insert(ReserveCommentDto dto);
	//public ReserveCommentDto getData(int num);
	public void update(ReserveCommentDto dto);
	public void delete(int num);
	public List<ReserveCommentDto> getAllCount();
		
}

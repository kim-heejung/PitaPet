package com.pet.spring.adopt.dao;

import java.util.List;

import com.pet.spring.adopt.dto.ReserveDto;

public interface ReserveDao {

	public List<ReserveDto> getList(ReserveDto dto);
	public int getCount();
	public void insert(ReserveDto dto);
	public ReserveDto getData(int num);
	public void addViewCount(int num);
	public void update(ReserveDto dto);
	public void delete(int num);
	
}

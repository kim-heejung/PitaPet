package com.pet.spring.reserve.dao;

import java.util.List;

import com.pet.spring.reserve.dto.ReserveDto;
import com.pet.spring.shelter.dto.ShelterDto;

public interface ReserveDao {

	public List<ReserveDto> getList(ReserveDto dto);
	public int getCount();
	public void insert(ReserveDto dto);
	public ReserveDto getData(int num);
	public void addViewCount(int num);
	public void update(ReserveDto dto);
	public void delete(int num);
	//예약확인 관련
	public List<ShelterDto> getCheckedList();
	public void getCheckedY(int num);
	public void getCheckedN(int num);
	public ReserveDto getDetailPwd(int num);
	
}

package com.pet.spring.reserve.dao;

import java.util.List;

import com.pet.spring.reserve.dto.ReserveDto;
import com.pet.spring.shelter.dto.ShelterDto;

public interface ReserveDao {

	public List<ReserveDto> getList(ReserveDto dto);
	public int getCount();
	public void addViewCount(int num);
	public ReserveDto getPrivatePwd(int num);
	public ReserveDto getData(int num);
	public List<ShelterDto> getShelterList();
	public void getReserveY(int num);
	public void getReserveN(int num);
	public void insert(ReserveDto dto);
	public void update(ReserveDto dto);
	public void delete(int num);
	
}

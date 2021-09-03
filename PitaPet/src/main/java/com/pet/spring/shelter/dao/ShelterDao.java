package com.pet.spring.shelter.dao;

import java.util.List;

import com.pet.spring.shelter.dto.ShelterDto;

public interface ShelterDao {
	public void insert(ShelterDto dto);
	public ShelterDto getData(String id);
	public void updateInfo(ShelterDto dto);
	public void deleteShelter(String id);
	public boolean isExist(String inputNum);
	public List<ShelterDto> getList();
}

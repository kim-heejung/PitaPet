package com.pet.spring.shelter.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.spring.shelter.dto.ShelterDto;

@Repository
public class ShelterDaoImpl implements ShelterDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(ShelterDto dto) {
		session.insert("shelter.insert",dto);
		
	}

	@Override
	public ShelterDto getData(String id) {
		return session.selectOne("shelter.getData", id);
	}

	@Override
	public void updateInfo(ShelterDto dto) {
		session.update("shelter.updateInfo",dto);
	}

	@Override
	public void deleteShelter(String id) {
		session.delete("shelter.deleteShelter",id);
	}

}

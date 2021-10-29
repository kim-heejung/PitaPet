package com.pet.spring.reserve.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.spring.reserve.dto.ReserveDto;
import com.pet.spring.shelter.dto.ShelterDto;

@Repository
public class ReserveDaoImpl implements ReserveDao {

	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<ReserveDto> getList(ReserveDto dto) {
		return session.selectList("reserve.getList", dto);
	}

	@Override
	public int getCount() {
		return session.selectOne("reserve.getCount");
	}
	
	@Override
	public void addViewCount(int num) {
		session.update("reserve.addViewCount", num);
	}
	
	@Override
	public ReserveDto getPrivatePwd(int num) {
		
		return session.selectOne("reserve.getPrivatePwd", num);
	}
	
	@Override
	public ReserveDto getData(int num) {
		return session.selectOne("reserve.getData", num);
	}
	
	@Override
	public List<ShelterDto> getShelterList() {
		return session.selectList("reserve.getShelterList");
	}
	
	@Override
	public void getReserveY(int num) {
		session.update("reserve.getReserveY", num);
	}
	
	@Override
	public void getReserveN(int num) {
		session.update("reserve.getReserveN", num);
	}

	@Override
	public void insert(ReserveDto dto) {
		session.insert("reserve.insert", dto);
	}

	@Override
	public void update(ReserveDto dto) {
		session.update("reserve.update", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("reserve.delete", num);
	}

}

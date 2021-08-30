package com.pet.spring.adopt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.spring.adopt.dto.ReserveDto;

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
	public void insert(ReserveDto dto) {
		session.insert("reserve.insert", dto);
	}

	@Override
	public ReserveDto getData(int num) {
		return session.selectOne("reserve.getData", num);
	}

	@Override
	public void addViewCount(int num) {
		session.update("reserve.addViewCount", num);
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

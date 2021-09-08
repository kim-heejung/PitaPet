package com.pet.spring.adopt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.spring.adopt.dto.AdoptDto;

@Repository
public class AdoptDaoImpl implements AdoptDao {

	@Autowired
	private SqlSession session;
	
	
	@Override
    public List<AdoptDto> getList(AdoptDto dto) {
        return session.selectList("adopt.getList", dto);
    }

	@Override
	public int getCount(AdoptDto dto) {
		return session.selectOne("adopt.getCount", dto);
	}

	@Override
	public AdoptDto getData(AdoptDto dto) {
		return session.selectOne("adopt.getData", dto);
	}

	@Override
	public void addViewCount(int num) {
		session.update("adopt.addViewCount", num);
	}

	@Override
	public void insert(AdoptDto dto) {
		session.insert("adopt.insert", dto);
	}

	@Override
	public void update(AdoptDto dto) {
		session.update("adopt.update", dto);
	}

	@Override
	public void delete(int num) {
		session.update("adopt.delete", num);
	}
	
}

package com.pet.spring.adopt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.spring.adopt.dto.AdoptLikeDto;

@Repository
public class AdoptLikeDaoImpl implements AdoptLikeDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(AdoptLikeDto dto) {
		session.insert("adoptBookMark.insert", dto);
	}

	@Override
	public void updateY(AdoptLikeDto dto) {
		session.update("adoptBookMark.updateY", dto);
	}

	@Override
	public void updateN(AdoptLikeDto dto) {
		session.update("adoptBookMark.updateN", dto);
	}

	@Override
	public AdoptLikeDto getData(AdoptLikeDto dto) {
		return session.selectOne("adoptBookMark.getData", dto);
	}

	@Override
	public List<AdoptLikeDto> getMyList(String id) {
		return session.selectList("adoptBookMark.getMyList", id);
	}

	@Override
	public int getCount(int num) {
		return session.selectOne("adoptBookMark.getCount", num);
	}

	@Override
	public int isExist(AdoptLikeDto dto) {
		return session.selectOne("adoptBookMark.isExist", dto);
	}
	
}

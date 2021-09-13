package com.pet.spring.reserve.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.spring.reserve.dto.ReserveCommentDto;

@Repository
public class ReserveCommentDaoImpl implements ReserveCommentDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<ReserveCommentDto> getList(ReserveCommentDto dto) {
		
		return session.selectList("reserveComment.getList", dto);
	}

	@Override
	public void delete(int num) {
		
		session.update("reserveComment.delete", num);
		
	}

	@Override
	public void insert(ReserveCommentDto dto) {
		
		session.insert("reserveComment.insert", dto);
		
	}

	@Override
	public int getSequence() {
		
		return session.selectOne("reserveComment.getSequence");
	}

	@Override
	public void update(ReserveCommentDto dto) {
		
		session.update("reserveComment.update", dto);
		
	}

	@Override
	public ReserveCommentDto getData(int num) {
		
		return session.selectOne("reserveComment.getData", num);
	}

	@Override
	public int getCount(int ref_group) {
		
		return session.selectOne("reserveComment.getCount", ref_group);
	}

	@Override
	public List<ReserveCommentDto> getAllCount() {
		
		return session.selectList("reserveComment.getAllCount");
	}
}

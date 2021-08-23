package com.pet.spring.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.spring.review.dto.ReviewCommentDto;

@Repository
public class ReviewCommentDaoImpl implements ReviewCommentDao{

	@Autowired SqlSession session;
	
	@Override
	public List<ReviewCommentDto> getList(ReviewCommentDto dto) {
		return session.selectList("reviewComment.getList", dto);
	}

	@Override
	public int getCount(int ref_group) {
		return session.selectOne("reviewComment.getCount", ref_group);
	}

	@Override
	public ReviewCommentDto getData(int num) {
		return session.selectOne("reviewComment.getData", num);
	}

	@Override
	public int getSequence() {
		return session.selectOne("reviewComment.getSequence");
	}

	@Override
	public void insert(ReviewCommentDto dto) {
		session.insert("reviewComment.insert", dto);		
	}

	@Override
	public void update(ReviewCommentDto dto) {
		session.update("reviewComment.update", dto);
	}

	@Override
	public void delete(int num) {
		session.update("reviewComment.delete", num);
	}

}

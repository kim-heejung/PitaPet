package com.pet.spring.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.spring.shop.dto.OrderDto;
import com.pet.spring.shop.dto.ShopDto;

@Repository
public class ShopDaoImpl implements ShopDao{

	@Autowired
	private SqlSession session;

	@Override
	public void insert(ShopDto dto) {
		// TODO Auto-generated method stub
		session.insert("shop.insert", dto);
	}

	@Override
	public List<ShopDto> getList(ShopDto dto) {
		// TODO Auto-generated method stub
		return session.selectList("shop.getList",dto);
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return session.selectOne("shop.getCount");
	}

	@Override
	public void minusCount(OrderDto dto) {
		session.update("shop.minusCount", dto);	
	}

	@Override
	public int getPrice(int num) {
		return session.selectOne("shop.getPrice", num);
	}	
	
}

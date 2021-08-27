package com.pet.spring.adopt.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.pet.spring.adopt.dao.AdoptDao;
import com.pet.spring.adopt.dto.AdoptDto;

public class AdoptServiceImpl implements AdoptService {

	@Autowired
	private AdoptDao dao;
	
	@Override
	public List<AdoptDto> getList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

}

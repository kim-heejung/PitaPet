package com.pet.spring.shelter.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.pet.spring.shelter.dao.ShelterDao;
import com.pet.spring.shelter.dto.ShelterDto;

@Repository
public class ShlterServiceImpl implements ShelterService{
	@Autowired
	private ShelterDao dao;
	
	@Override
	public void addShelter(ShelterDto dto) {
		dao.insert(dto);
	}

	@Override
	public void getInfo(HttpSession session, ModelAndView mView) {
		String id=(String)session.getAttribute("id");
		ShelterDto dto=dao.getData(id);
		mView.addObject("dto",dto);
		
	}

	@Override
	public void updateShelter(HttpSession session, ShelterDto dto) {
		String id=(String)session.getAttribute("id");
		dto.setId(id);
		dao.updateInfo(dto);
		
	}

	@Override
	public void deleteShelter(HttpSession session) {
		String id=(String)session.getAttribute("id");
		dao.deleteShelter(id);
		
	}

	@Override
	public Map<String, Object> isExistNum(String inputNum) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isExist",dao.isExist(inputNum));
		return map;
	}

}

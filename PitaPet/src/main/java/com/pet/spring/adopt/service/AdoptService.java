package com.pet.spring.adopt.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.pet.spring.adopt.dto.AdoptDto;
import com.pet.spring.adopt.dto.ReserveDto;

public interface AdoptService {

	public List<AdoptDto> getList(HttpServletRequest request);
	//테스트용
	public void testGetList(HttpServletRequest request);
	
	public AdoptDto getDetail(HttpServletRequest request);
	
	public Map<String, Object> insert(AdoptDto dto, HttpServletRequest request);
	
	public Map<String, Object> update(AdoptDto dto, HttpServletRequest request);
	
	public Map<String, Object> delete(int num, HttpServletRequest request);
	
}

package com.pet.spring.shelter.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.pet.spring.shelter.dto.ShelterDto;

public interface ShelterService {
	public void addShelter(ShelterDto dto);
	public void getInfo(HttpSession session, ModelAndView mView);
	public void updateShelter(HttpSession session,ShelterDto dto);
	public void deleteShelter(HttpSession session);
	public Map<String,Object> isExistNum(String inputNum);
}

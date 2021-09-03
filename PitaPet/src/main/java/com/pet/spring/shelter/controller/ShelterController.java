package com.pet.spring.shelter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.spring.shelter.service.ShelterService;

@Controller
public class ShelterController {
	
	@Autowired
	private ShelterService service;
	
	@RequestMapping("/shelter/list")
	public ModelAndView getList(ModelAndView mView) {
		service.getList(mView);
		mView.setViewName("shelter/list");
		return mView;
	}
}

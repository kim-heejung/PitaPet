package com.pet.spring.donation.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.spring.donation.service.DonationService;
import com.pet.spring.users.dto.UsersDto;

@Controller
public class DonationController {
	@Autowired private DonationService service;
	
	@RequestMapping("/donation/main")
	public ModelAndView donate(ModelAndView mView, HttpSession session) {
		service.dbInfo(mView, session);
		mView.setViewName("donation/main");
		return mView;
	}
	
	@RequestMapping("/donation/test")
	public String updateDona(HttpServletRequest request, UsersDto dto) {
		service.updateDona(request, dto);
		return "donation/test";
	}
	
}

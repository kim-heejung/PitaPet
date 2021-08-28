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
	
	@RequestMapping("/donation/modal")
	public ModelAndView donate(ModelAndView mView, HttpSession session) {
		service.dbInfo(mView, session);
		mView.setViewName("donation/modal");
		return mView;
	}
	
	@RequestMapping("/donation/payment")
	public String updateDona(HttpServletRequest request, UsersDto dto) {
		service.updateDona(request, dto);
		return "donation/payment";
	}
	
}

package com.pet.spring.donation.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.pet.spring.users.dto.UsersDto;

public interface DonationService {
	public void dbInfo(ModelAndView mView, HttpSession session);
	public void updateDona(HttpServletRequest request, UsersDto dto);
}

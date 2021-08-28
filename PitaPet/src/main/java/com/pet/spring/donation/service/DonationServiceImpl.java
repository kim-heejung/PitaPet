package com.pet.spring.donation.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.pet.spring.users.dao.UsersDao;
import com.pet.spring.users.dto.UsersDto;

@Service
public class DonationServiceImpl implements DonationService{
	@Autowired private UsersDao dao;
	
	@Override
	public void dbInfo(ModelAndView mView, HttpSession session) {
		String id=(String)session.getAttribute("id");
	    //dao 로 로그인 된 아이디 정보를 읽어오기
	    UsersDto dto=dao.getData(id);
	    //ModelAndView 에 가져온 UsersDto 를 담기
	    mView.addObject("dto", dto);
	}

	@Override
	public void updateDona(HttpServletRequest request, UsersDto dto) {
		int donation=Integer.parseInt(request.getParameter("donation"));
		String id = (String)request.getSession().getAttribute("id");
	    dto=new UsersDto();
		dto.setId(id);
	    dto.setDonation(donation);
	      
	    dao.updateDonate(dto);	
	}

}

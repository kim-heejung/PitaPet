package com.pet.spring.users.controller;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pet.spring.users.dto.UsersDto;
import com.pet.spring.users.service.UsersService;


@Controller
public class UsersController {
	@Autowired
	private UsersService service;
	
	@RequestMapping("/users/signup_form")
	public String singupForm() {
		return "users/signup_form";
	}
	
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String,Object> checkid(@RequestParam String inputId){
		return service.isExistId(inputId);
	}
		
	@RequestMapping(value = "/users/signup",method=RequestMethod.POST)
	public ModelAndView signup(ModelAndView mView,UsersDto dto) {
		System.out.println("엥?");
		service.addUser(dto);
		mView.setViewName("users/signup");
		return mView;
	}
	@RequestMapping("/users/loginform")
	public String loginform() {
		return "users/loginform";
	}
	

	@RequestMapping("/users/login")
	public ModelAndView login(ModelAndView mView, UsersDto dto, @RequestParam String url, HttpSession session) {

		service.loginProcess(dto, session);
		
		String encodedUrl=URLEncoder.encode(url);
		mView.addObject("url", url);
		mView.addObject("encodedUrl", encodedUrl);
		
		mView.setViewName("users/login");
		return mView;
	}
	
}

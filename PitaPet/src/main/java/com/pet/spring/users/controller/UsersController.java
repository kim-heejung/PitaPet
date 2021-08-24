package com.pet.spring.users.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pet.spring.shelter.dao.ShelterDao;
import com.pet.spring.shelter.dto.ShelterDto;
import com.pet.spring.shelter.service.ShelterService;
import com.pet.spring.users.dao.UsersDao;
import com.pet.spring.users.dto.UsersDto;
import com.pet.spring.users.service.UsersService;


@Controller
public class UsersController {
	@Autowired
	private UsersService service;
	
	@Autowired
	private ShelterService service2;
	
	@Autowired
	private UsersDao dao;
	
	@Autowired
	private ShelterDao sDao;
	
	@RequestMapping("/api/users/info")
	@ResponseBody
	public Map<String,Object> authInfo(HttpSession session, HttpServletRequest request) {
		Map<String,Object> map=new HashMap<>();
		String id=(String)session.getAttribute("id");
		
		map.put("UsersDto", dao.getData(id));
		map.put("ShelterDto", sDao.getData(id));
		
		return map;
	}
	
	@RequestMapping(value = "/api/users/signup",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> signup(UsersDto dto,ShelterDto sDto) {
		service.addUser(dto);
		if(dto.getGroupNum()==1) { //보호소 회원이면
			service2.addShelter(sDto);
		}
		Map<String,Object> map=new HashMap<>();
		map.put("isSuccess",true);
		   
		return map;
	}
	
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
	public ModelAndView signup(ModelAndView mView,UsersDto dto,ShelterDto sDto) {
		service.addUser(dto);
		if(dto.getGroupNum()==1) {
			service2.addShelter(sDto);
		}
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
	
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		return "redirect:/";
	}
	
	@RequestMapping("/users/info")
	public ModelAndView authInfo(HttpSession session, ModelAndView mView,HttpServletRequest request) {
		service.getInfo(session, mView);
		mView.setViewName("users/info");
		return mView;
	}
	
	@RequestMapping("/users/pwd_updateform")
	public ModelAndView authPwdUpdateForm(ModelAndView mView,HttpServletRequest request) {
		mView.setViewName("users/pwd_updateform");
		return mView;
	}
	
	@RequestMapping(value="/users/update",method=RequestMethod.POST)
	public ModelAndView authUpdate(HttpSession session,ModelAndView mView,UsersDto dto,HttpServletRequest request,ShelterDto sDto) {
		service.updateUser(session, dto);
		service2.updateShelter(session, sDto);
		mView.setViewName("redirect:/users/info.do");
		return mView;
	}
	
	@RequestMapping("/users/pwd_update")
	public ModelAndView authPwdUpdate(HttpServletRequest request,ModelAndView mView, HttpSession session, @RequestParam String pwd, @RequestParam String newPwd) {
		service.updateUserpwd(mView, session, pwd, newPwd);
		mView.setViewName("users/pwd_update");
		return mView;
	}
	
	@RequestMapping("/users/updateform")
	public ModelAndView authUpdateform(ModelAndView mView,HttpSession session,HttpServletRequest request) {
		service.getInfo(session, mView);
		mView.setViewName("users/updateform");
		return mView;
	}
	
	@RequestMapping("/users/delete")
	public ModelAndView authDelete(HttpSession session,ModelAndView mView,HttpServletRequest request) {
		service.deleteUser(session,mView);
		service2.deleteShelter(session);
		mView.setViewName("users/delete");
		return mView;
	}
}

package com.pet.spring.users.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.spring.users.dao.UsersDao;
import com.pet.spring.users.dto.UsersDto;


@Service
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	private UsersDao dao;

	@Override
	public Map<String, Object> isExistId(String inputId) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isExist",dao.isExist(inputId));
		return map;
	}

	@Override
	public void addUser(UsersDto dto) {
		
		String pwd=dto.getPwd();
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(pwd);
		dto.setPwd(encodedPwd);
		
		dao.insert(dto);
		
	}

	@Override
	public void loginProcess(UsersDto dto, HttpSession session) {
		boolean isValid=false;
		
		UsersDto result=dao.getData(dto.getId());
		if(result !=null) {
			String encodedPwd=result.getPwd(); 
			String inputPwd=dto.getPwd(); 
			
			isValid=BCrypt.checkpw(inputPwd,encodedPwd);
		}
		if(isValid) {
			session.setAttribute("id", dto.getId());
		}
		
	}

	@Override
	public void getInfo(HttpSession session, ModelAndView mView) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUserpwd(ModelAndView mView, HttpSession session, String pwd, String newPwd) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> saveProfileImage(HttpServletRequest request, MultipartFile mFile) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUser(HttpSession session, UsersDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(HttpSession session, ModelAndView mView) {
		// TODO Auto-generated method stub
		
	}
	
	
}

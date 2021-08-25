package com.pet.spring.users.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.spring.shelter.dto.ShelterDto;
import com.pet.spring.users.dto.UsersDto;

public interface UsersService {
	public Map<String, Object> isExistId(String inputId);
	public void addUser(UsersDto dto,ShelterDto sDto);
	public void loginProcess(UsersDto dto, HttpSession session);
	public void getInfo(HttpSession session, ModelAndView mView);
	public void updateUserpwd(ModelAndView mView,HttpSession session, String pwd, String newPwd);
	public Map<String,Object> saveProfileImage(HttpServletRequest request, MultipartFile mFile);
	public void updateUser(HttpSession session,UsersDto dto,ShelterDto sDto);
	public void deleteUser(HttpSession session,ModelAndView mView);
}

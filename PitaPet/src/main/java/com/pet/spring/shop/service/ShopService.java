package com.pet.spring.shop.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.spring.shop.dto.ShopDto;
import com.pet.spring.users.dto.UsersDto;

public interface ShopService {
	public void getList(ModelAndView mView,HttpServletRequest request);
	public void insert(ShopDto dto);
	public Map<String, Object> uploadAjaxImage(ShopDto dto, HttpServletRequest request);
	public void dbInfo(ModelAndView mView, HttpServletRequest request);
	public void buy(HttpServletRequest request, UsersDto dto);
}

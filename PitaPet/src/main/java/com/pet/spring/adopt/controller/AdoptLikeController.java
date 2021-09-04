package com.pet.spring.adopt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.spring.adopt.dto.AdoptLikeDto;
import com.pet.spring.adopt.service.AdoptLikeService;

@Controller
public class AdoptLikeController {
	
	@Autowired
	private AdoptLikeService service;
	
	
	@RequestMapping("/adoptlike/like")
	public String insert(HttpServletRequest request) {
		
		String id=(String)request.getSession().getAttribute("id");
		int isExist=service.isExist(request);
		
		if(isExist < 1) {
			service.insert(request);
		}else {
			service.updateY(request);
		}
		
		return "redirect:/adopt/list.do";
	}
	@RequestMapping("/api/adoptlike/like")
	@ResponseBody
	public Map<String, Object> updateY(HttpServletRequest request){
		
		service.updateY(request);
		
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		
		return map;
	}
	
	@RequestMapping("/api/adoptlike/unlike")
	@ResponseBody
	public Map<String, Object> updateN(HttpServletRequest request){
		
		return service.updateN(request);
	}
	 
	
	@RequestMapping("/api/adoptlike/check")
	@ResponseBody
	public AdoptLikeDto getData(HttpServletRequest request){
		 
		return service.getData(request);
	}
	
	
	@RequestMapping("/api/adoptlike/count")
	@ResponseBody
	public Map<String, Object> getCount(@RequestParam int num){
		
		return service.getCount(num);
	}

	
	@RequestMapping("/api/adoptlike/countlist")
	@ResponseBody
	public List<AdoptLikeDto> getYCountList(){
		
		return service.getYCountList();
	}
	
}

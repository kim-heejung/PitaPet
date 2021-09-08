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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.spring.adopt.dto.AdoptLikeDto;
import com.pet.spring.adopt.service.AdoptLikeService;

@Controller
public class AdoptLikeController {
	
	@Autowired
	private AdoptLikeService service;
	
	
	@RequestMapping("/api/adoptlike/isexist")
    @ResponseBody
    public int isExist(HttpServletRequest request){
       return service.isExist(request);
    }
	
	@RequestMapping(value="/api/adoptlike/insert", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request){
		
		return service.insert(request);
	}
	//테스트용-후에 삭제될 부분
	@RequestMapping("/adoptlike/like")
	public String testInsert(HttpServletRequest request) {
		
		String id=(String)request.getSession().getAttribute("id");
		int isExist=service.isExist(request);
		
		if(isExist < 1) {
			service.testInsert(request);
		}else {
			service.updateY(request);
		}
		
		return "redirect:/adopt/list.do";
	}

  
	@RequestMapping(value="/api/adoptlike/like", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateY(HttpServletRequest request){
		
		service.updateY(request);
		
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		
		return map;
	}
	
	@RequestMapping(value="/api/adoptlike/unlike", method = RequestMethod.POST)
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

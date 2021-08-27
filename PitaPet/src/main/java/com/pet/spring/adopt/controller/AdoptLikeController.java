package com.pet.spring.adopt.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.spring.adopt.dto.AdoptLikeDto;
import com.pet.spring.adopt.service.AdoptLikeService;

@Controller
public class AdoptLikeController {
	
	@Autowired
	private AdoptLikeService service;
	
	
	
	//insert, getData는 adoptController에 적용.
	
	//updateY, updateN은 vue로도 할 수도 있을거 같지만 일단 만듬.
	@RequestMapping("/api/adoptlike/like")
	@ResponseBody
	public Map<String, Object> updateY(HttpServletRequest request){
		
		return service.updateY(request);
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
	
	@RequestMapping("/api/adoptlike/checklist")
	@ResponseBody
	public List<AdoptLikeDto> getDataList(HttpServletRequest request){
		 
		return null;
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
	
	
	@RequestMapping("/api/adoptlike/mylist")
	@ResponseBody
	public List<AdoptLikeDto> getMyList(HttpSession session){
		
		return service.getMyList(session);	
	}

}

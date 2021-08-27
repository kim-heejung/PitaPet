package com.pet.spring.adopt.controller;

import java.util.HashMap;
import java.util.List;
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

import com.pet.spring.adopt.dto.AdoptDto;
import com.pet.spring.adopt.dto.AdoptLikeDto;
import com.pet.spring.adopt.dto.ReserveDto;
import com.pet.spring.adopt.service.AdoptLikeService;
import com.pet.spring.adopt.service.AdoptService;
import com.pet.spring.adopt.service.ReserveService;

@Controller
public class AdoptController {

	@Autowired
	private AdoptService service;
	//테스트용
	@Autowired
	private ReserveService reserveService;
	//테스트용
	@Autowired
	private AdoptLikeService adoptLikeService;
	
	
	
	@RequestMapping("/api/adopt/list")
	@ResponseBody
	public List<AdoptDto> getList(HttpServletRequest request) {

		return service.getList(request);
	}
	//테스트용
	@RequestMapping("/adopt/list")
	public String testGetList(HttpServletRequest request,
			HttpSession session) {

		service.testGetList(request);
		
		adoptLikeService.testGetYCountList(request);
		
		//List<AdoptLikeDto> list=adoptLikeService.testGetYList(session);
		//request.setAttribute("myList", list);
		

		return "adopt/list";
	}
	
	
	@RequestMapping(value = "api/adopt/detail", method = RequestMethod.GET)
	@ResponseBody
	public AdoptDto detail(HttpServletRequest request) {
		
		return service.getDetail(request);
	}
	//테스트용
	/*
	@RequestMapping(value = "adopt/detail", method = RequestMethod.GET)
	public String testDetail(@RequestParam int num, HttpServletRequest request) {

		 AdoptDto dto=service.getDetail(request);
		 
		 List<ReserveDto> list=reserveService.testGetList(request, num);
		 
		 request.setAttribute("dto", dto);
		 request.setAttribute("list", list);
		 
		 //둘중에 하나라도 값이 없으면 오류남.
		
		 return "adopt/detail";
	}
	*/
	//테스트용
	@RequestMapping("adopt/detail")
	public String testDetail(HttpServletRequest request) {

		 AdoptDto dto=service.getDetail(request);
		 //List<ReserveDto> list=reserveService.testGetList(request);
		 
		 request.setAttribute("dto", dto);
		 //request.setAttribute("list", list);
		 
		 //둘중에 하나라도 값이 없으면 오류남.
		
		 return "adopt/detail";
	}
	
	
	@RequestMapping("/adopt/insertform")
	public String authInsertForm() {

		return "adopt/insertform";
		
	}
	
	@RequestMapping("api/adopt/insert")
	@ResponseBody
	public Map<String, Object> authInsert(AdoptDto dto, HttpServletRequest request) {
		
		return service.insert(dto, request);
		
	}
	
	
	/*
	@RequestMapping("/adopt/updateform")
	public ModelAndView authUpdateform(@RequestParam int num) {

		service.getDetail(num);

		return new ModelAndView("adopt/updateform");
	}*/
	//테스트용
	@RequestMapping("/adopt/updateform2")
	public ModelAndView testUpdateform(@RequestParam int num, HttpServletRequest request) {

		//service.getDetail(num);
		//AdoptDto dto=service.getDetail(num);
		//request.setAttribute("dto", dto);

		return new ModelAndView("adopt/updateform");
	}
	
	@RequestMapping("/api/adopt/update")
	@ResponseBody
	public Map<String, Object> authUpdate(AdoptDto dto, HttpServletRequest request) {

		return service.update(dto, request);
	}
	
	
	@RequestMapping("/api/adopt/delete")
	@ResponseBody
	public Map<String, Object> authDelete(HttpServletRequest request, @RequestParam int num) {

		return service.delete(num, request);
		
		
	}
		
}

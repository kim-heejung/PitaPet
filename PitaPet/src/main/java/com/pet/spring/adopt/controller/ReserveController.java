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

import com.pet.spring.adopt.dto.ReserveDto;
import com.pet.spring.adopt.service.ReserveService;

@Controller
public class ReserveController {

   @Autowired
   private ReserveService service;
   
   
   
   @RequestMapping("api/reserve/list")
   @ResponseBody
   public List<ReserveDto> getList(HttpServletRequest request, @RequestParam int num) {
      
	   return service.getList(request, num);
	   
   }
   //테스트용
   @RequestMapping("/reserve/list")
   public String testGetList(HttpServletRequest request) {
      
      service.testGetList(request);
      
      return "reserve/list";
   }
   
   
   @RequestMapping("/reserve/insertform")
   public String authInsertForm(HttpServletRequest request, @RequestParam int num) {
	   
	  request.setAttribute("num", num);
      
      return "reserve/insertform";
   }
   
   @RequestMapping(value="/api/reserve/insert")
   @ResponseBody
   public Map<String, Object> authInsert(ReserveDto dto, HttpServletRequest request) {
		
		return service.insert(dto, request);	
   }

   
	@RequestMapping(value = "/api/reserve/detail", method = RequestMethod.GET)
	@ResponseBody
	public ReserveDto dtail(HttpServletRequest request) {

		return service.getDetail(request);

	}
	// 테스트용 아이디별로 글 하나만 작성할 수 있게 하지않음 오류 발생
	@RequestMapping(value = "/reserve/detail", method = RequestMethod.GET)
	// 주소창에 전달된 파라미터 추출, request 사용해야 함.
	public String testDtail(HttpServletRequest request) {

		ReserveDto dto = service.getDetail(request);

		request.setAttribute("dto", dto);

		return "reserve/detail";

	}

	
   //확인하기
	/*
   @RequestMapping("/reserve/updateform")
   public ModelAndView authUpdateform(HttpServletRequest request) {
      
      service.getDetail(request);
      
      return new ModelAndView("reserve/updateform");
   } 
   */
   //테스트용
   @RequestMapping("/reserve/updateform2")
   public ModelAndView authUpdateform2(HttpServletRequest request) {
      
      ReserveDto dto=service.getDetail(request);
      request.setAttribute("dto", dto);
      
      return new ModelAndView("reserve/updateform");
   }
   
	@RequestMapping(value="/api/reserve/update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> authUpdate(ReserveDto dto, HttpServletRequest request) {

		return service.update(dto);
	}
	
	
	@RequestMapping("/api/reserve/delete")
	@ResponseBody
	public Map<String, Object> authDelete(HttpServletRequest request, @RequestParam int num) {

		return service.delete(num, request);
	}	
	
}

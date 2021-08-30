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
	//@Autowired
	//private ReserveService reserveService;
	//테스트용
	@Autowired
	private AdoptLikeService adoptLikeService;
	
	
	
	@RequestMapping("/api/adopt/list")
	@ResponseBody
	public List<AdoptDto> getList(HttpServletRequest request) {
		
		return service.getList(request);
	}
	//테스트용-후에 삭제될 부분
	@RequestMapping("/adopt/list")
	public String testGetList(HttpServletRequest request, HttpSession session
		) {

		String id=(String)session.getAttribute("id");
		
		if(id == null) {
			service.testGetList(request);
		}else {
			
			request.setAttribute("idCheck", id);
			
			service.testGetIdList(request);
			adoptLikeService.testGetYCountList(request);
		}
		
		//service.testGetList(request);

		

		/*
		String id=(String)session.getAttribute("id");
		if(!id.equals("")) {
			
		}
		*/
		
		//adoptLikeService.testIdYList(session);
		//List<AdoptLikeDto> list=adoptLikeService.getIdYList(session);
		//request.setAttribute("idYList", list);
		
		//AdoptLikeDto dto=adoptLikeService.getData(request);
		//request.setAttribute("idYdata", dto);
		

		return "adopt/list";
	}
	// 테스트용-후에 삭제될 부분
	/*
	@RequestMapping("/adoptlike/test")
	public String test(HttpServletRequest request, HttpSession session) {

		AdoptLikeDto dto=adoptLikeService.getData(request);
		request.setAttribute("idYdata", dto);

		return "redirect:/adopt/list.do";
	}*/
	
	
	@RequestMapping("api/adopt/detail")
	@ResponseBody
	public AdoptDto detail(HttpServletRequest request) {
		
		return service.getDetail(request);
	}
	//테스트용-후에 삭제될 부분
	@RequestMapping(value = "adopt/detail", method = RequestMethod.GET)
	public String testDetail(@RequestParam int num, HttpServletRequest request) {

		String id=(String)request.getSession().getAttribute("id");
		
		if(id != null) {
			request.setAttribute("idCheck", id);
			
			AdoptLikeDto dto2=adoptLikeService.getData(request);
			request.setAttribute("like", dto2);
		}
		
		AdoptDto dto = service.getDetail(request);
		int count=adoptLikeService.getTestCount(num);
		
		// List<ReserveDto> list=reserveService.testGetList(request, num);

		request.setAttribute("dto", dto);
		request.setAttribute("count", count);
		// request.setAttribute("list", list);

		// 둘중에 하나라도 값이 없으면 오류남.

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
	
	
	@RequestMapping("/adopt/updateform")
	public String testUpdateform(HttpServletRequest request) {

		service.updateDetail(request);
		
		return "adopt/updateform";
	}
	
	
	@RequestMapping("/api/adopt/update")
	@ResponseBody
	public Map<String, Object> authUpdate(AdoptDto dto, HttpServletRequest request) {

		return service.update(dto, request);
	}
	
	
	@RequestMapping("/api/adopt/delete")
	@ResponseBody
	public Map<String, Object> authDelete(@RequestParam int num) {

		return service.delete(num);
	}
	
}

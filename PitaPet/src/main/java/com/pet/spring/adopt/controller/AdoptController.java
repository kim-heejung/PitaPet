package com.pet.spring.adopt.controller;

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

import com.pet.spring.adopt.dto.AdoptDto;
import com.pet.spring.adopt.dto.AdoptLikeDto;
import com.pet.spring.adopt.service.AdoptLikeService;
import com.pet.spring.adopt.service.AdoptService;

@Controller
public class AdoptController {

	@Autowired
	private AdoptService service;
	//테스트용-후에 삭제될 부분
	@Autowired
	private AdoptLikeService adoptLikeService;
	
	
	
	@RequestMapping("/adopt/procedure")
	public String adoptionProcedure() {
		return "adopt/procedure";
	}
	
	
	@RequestMapping("/api/adopt/list")
	@ResponseBody
	public List<AdoptDto> getList(HttpServletRequest request) {
		
		return service.getList(request);
	}
	//테스트용
	@RequestMapping("/adopt/list")
	public String testGetList(HttpServletRequest request, HttpSession session
		) {
		
		service.testGetList(request);
		
		//로그인 여부 확인용
		String id=(String)session.getAttribute("id");
		request.setAttribute("idCheck", id);

		return "adopt/list";
	}
  
	@RequestMapping("/api/adopt/paging")
	@ResponseBody
	public Map<String, Object> getListPaging(HttpServletRequest request){
		
		return service.getListPaging(request);
	}
	
	
	@RequestMapping("api/adopt/addviewcount")
	@ResponseBody
	public Map<String, Object> addViewCount(@RequestParam int num){
		
		return service.addViewCount(num);
	}
	
	@RequestMapping("api/adopt/detail")
	@ResponseBody
	public AdoptDto detail(HttpServletRequest request) {
		
		return service.getDetail(request);
	}
	//테스트용
	@RequestMapping(value = "adopt/detail", method = RequestMethod.GET)
	public String testDetail(@RequestParam int num, HttpServletRequest request) {

		String id=(String)request.getSession().getAttribute("id");
		
		if(id != null) {
			request.setAttribute("idCheck", id);
			
			AdoptLikeDto dto2=adoptLikeService.getData(request);
			request.setAttribute("like", dto2);
		}
		
		//조회수
		service.addViewCount(num);
		
		AdoptDto dto = service.testGetDetail(request);
		int count=adoptLikeService.getTestCount(num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("count", count);
		
		return "adopt/detail";
	}
	
	
	@RequestMapping("/adopt/private/insertform")
	public String authInsertForm() {

		return "adopt/insertform";
	}
	
	@RequestMapping("api/adopt/insert")
	@ResponseBody
	public Map<String, Object> authInsert(AdoptDto dto, HttpServletRequest request) {
		
		return service.insert(dto, request);
	}
	
	
	@RequestMapping("/adopt/private/updateform")
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
	
	
	//생일 메인 노출
	@RequestMapping("/api/adopt/birthdata")
	@ResponseBody
	public AdoptDto mainBirthData() {
		
		return service.mainBirthData();
	}
	
	@RequestMapping("/api/adopt/birthlist")
	@ResponseBody
	public List<AdoptDto> mainBirthList() {
		
		return service.mainBirthList();
	}
	
}

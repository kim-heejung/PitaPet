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

import com.pet.spring.adopt.dto.AdoptDto;
import com.pet.spring.adopt.dto.AdoptLikeDto;
import com.pet.spring.adopt.service.AdoptLikeService;
import com.pet.spring.adopt.service.AdoptService;

@Controller
public class AdoptController {

	@Autowired
	private AdoptService service;
	@Autowired
	private AdoptLikeService adoptLikeService;
	
	
	@RequestMapping("/adopt/procedure")
	public String adoptionProcedure() {
		
		return "adopt/procedure";
	}
	
	
	@RequestMapping("/adopt/list")
	public String getList(HttpServletRequest request, HttpSession session
		) {
		
		/*
		service.getList(request);
		
		//로그인 여부 확인용
		String id=(String)session.getAttribute("id");
		request.setAttribute("idCheck", id);
		*/

		return "adopt/list";
	}
	@RequestMapping("/api/adopt/list")
	@ResponseBody
	public List<AdoptDto> apiGetList(HttpServletRequest request) {
		
		return service.apiGetList(request);
	}
  
	@RequestMapping("/api/adopt/paging")
	@ResponseBody
	public Map<String, Object> apiPaging(HttpServletRequest request){
		
		return service.apiPaging(request);
	}
	
	
	/*
	@RequestMapping("api/adopt/addviewcount")
	@ResponseBody
	public Map<String, Object> addViewCount(@RequestParam int num){
		
		return service.addViewCount(num);
	}
	*/
	
	@RequestMapping("adopt/detail")
	public String detail(@RequestParam int num, HttpServletRequest request) {

		String id=(String)request.getSession().getAttribute("id");
		
		if(id != null) {
			request.setAttribute("idCheck", id);
			
			//아이디별 해당 게시글의 좋아요 여부 
			AdoptLikeDto dto2=adoptLikeService.likeGetData(request);
			request.setAttribute("like", dto2);
		}
		
		//조회수
		service.addViewCount(num);
		
		//해당 게시글의 정보
		AdoptDto dto = service.detail(request);
		//해당 게시글의 좋아요 갯수
		int count=adoptLikeService.likeCount(num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("count", count);
		
		return "adopt/detail";
	}
	/*
	@RequestMapping("api/adopt/detail")
	@ResponseBody
	public AdoptDto detail(HttpServletRequest request) {
		
		return service.apiDetail(request);
	}
	*/
	
	
	@RequestMapping("/adopt/private/insertform")
	public String authInsertForm() {

		return "adopt/insertform";
	}
	
	@RequestMapping("/adopt/insert")
	public String authInsert(AdoptDto dto, HttpServletRequest request) {
		
		service.insert(dto, request);
		
		return "redirect:/adopt/list.do";
	}
	
	
	@RequestMapping("/adopt/private/updateform")
	public String updateform(HttpServletRequest request) {

		//수정할 해당 게시글의 정보
		service.updateDetail(request);
		
		return "adopt/updateform";
	}
	
	@RequestMapping("/adopt/update")
	public String authUpdate(AdoptDto dto, HttpServletRequest request,
			@RequestParam int num) {

		service.update(dto, request);
		
		return "redirect:/adopt/detail.do?num="+num;
	}
	
	
	@RequestMapping("/adopt/delete")
	public String authDelete(@RequestParam int num) {

		service.delete(num);
		
		return "redirect:/adopt/list.do";
	}
	
	
	//생일 메인 노출
	
	@RequestMapping("/api/adopt/birthdata")
	@ResponseBody
	public AdoptDto apiBirthData() {
		
		return service.apiBirthData();
	}
	
	@RequestMapping("/api/adopt/birthlist")
	@ResponseBody
	public List<AdoptDto> apiBirthList() {
		
		return service.apiBirthList();
	}
	
}

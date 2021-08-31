package com.pet.spring.adopt.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.spring.adopt.dto.ReserveDto;
import com.pet.spring.adopt.service.ReserveService;

@Controller
public class ReserveController {

	@Autowired
	private ReserveService service;
   
    
	@RequestMapping("api/reserve/list")
	@ResponseBody
	public List<ReserveDto> getList(HttpServletRequest request) {

		return service.getList(request);

	}
    //테스트용-후에 삭제될 부분
	@RequestMapping("/reserve/list")
	public String testGetList(HttpServletRequest request) {

		service.testGetList(request);

		return "reserve/list";
	}
	
	
	@RequestMapping("/api/reserve/paging")
	@ResponseBody
	public Map<String, Object> getListPaging(@RequestParam int pageNum){
		
		return service.getListPaging(pageNum);
	}
 
   
	@RequestMapping("/reserve/insertform")
	public String authInsertForm(HttpServletRequest request) {

		return "reserve/insertform";
	}
	
	@RequestMapping(value = "/api/reserve/insert")
	@ResponseBody
	public Map<String, Object> authInsert(ReserveDto dto, HttpServletRequest request) {

		return service.insert(dto, request);
	}
	
  
	@RequestMapping("/api/reserve/detail")
	@ResponseBody
	public ReserveDto dtail(HttpServletRequest request) {

		return service.getDetail(request);

	}
	//테스트용-후에 삭제될 부분
	@RequestMapping("/reserve/detail")
	public String testDtail(HttpServletRequest request) {

		ReserveDto dto = service.getDetail(request);

		request.setAttribute("dto", dto);

		return "reserve/detail";
	}

   
	@RequestMapping("/reserve/updateform")
	public String updateform(HttpServletRequest request) {

		ReserveDto dto = service.getDetail(request);
		request.setAttribute("dto", dto);

		return "reserve/updateform";
	}

	@RequestMapping("/api/reserve/update")
	@ResponseBody
	public Map<String, Object> authUpdate(ReserveDto dto, HttpServletRequest request) {

		return service.update(dto);
	}
	
	
	@RequestMapping("/api/reserve/delete")
	@ResponseBody
	public Map<String, Object> authDelete(@RequestParam int num) {

		return service.delete(num);
	}	
	
}

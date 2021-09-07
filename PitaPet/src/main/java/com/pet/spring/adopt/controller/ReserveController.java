package com.pet.spring.adopt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pet.spring.adopt.dto.ReserveCommentDto;
import com.pet.spring.adopt.dto.ReserveDto;
import com.pet.spring.adopt.service.ReserveService;
import com.pet.spring.shelter.dto.ShelterDto;

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
	public String testGetList(HttpServletRequest request, HttpSession session) {

		service.testGetList(request);
		
		List<ReserveCommentDto> dto2=service.getAllCount();
		request.setAttribute("allCount", dto2);
		
		String id=(String)session.getAttribute("id");
		request.setAttribute("id", id);
		
		List<ShelterDto> dto3=service.getCheckedList();
		request.setAttribute("checked", dto3);

		return "reserve/list";
	}
	
	
	@RequestMapping("/api/reserve/paging")
	@ResponseBody
	public Map<String, Object> getListPaging(@RequestParam int pageNum){
		
		return service.getListPaging(pageNum);
	}
 
   
	@RequestMapping("/reserve/private/insertform")
	public String authInsertForm(HttpServletRequest request) {

		return "reserve/insertform";
	}
	
	@RequestMapping(value = "/api/reserve/insert")
	@ResponseBody
	public Map<String, Object> authInsert(ReserveDto dto, HttpServletRequest request) {

		return service.insert(dto, request);
	}
	
	
	@RequestMapping("/reserve/detailcheckform")
	public String detailCheckForm (HttpServletRequest request) {

		int num=(int)Integer.parseInt(request.getParameter("num"));
		request.setAttribute("num", num);
		
		return "reserve/detailcheck";
	}

	@RequestMapping("/reserve/detailcheck")
	@ResponseBody
	public Map<String, Object> detailCheck (@RequestParam int num, @RequestParam java.lang.String pwd) {

		return service.detailCheck(num, pwd);
	}
	
	@RequestMapping("/api/reserve/addViewCount")
	@ResponseBody
	public Map<String, Object> addViewCount(@RequestParam int num){
		
		return service.addViewCount(num);
	}
  
	@RequestMapping("/api/reserve/detail")
	@ResponseBody
	public ReserveDto dtail(HttpServletRequest request) {

		return service.getDetail(request);

	}
	//테스트용-후에 삭제될 부분
	@RequestMapping("/reserve/detail")
	public String testDtail(HttpServletRequest request) {

		int num=Integer.parseInt(request.getParameter("num"));
		service.addViewCount(num);
		
		ReserveDto dto = service.getDetail(request);
		request.setAttribute("dto", dto);
		
		service.testMoreCommentList(request);
		
		List<ShelterDto> dto2=service.getCheckedList();
		request.setAttribute("checked", dto2);

		return "reserve/detail";
	}

   
	@RequestMapping("/reserve/private/updateform")
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
	
	
	//댓글 리스트
	@RequestMapping("/api/reserve/commentlist")
	@ResponseBody
	public List<ReserveCommentDto> ajaxCommentList(HttpServletRequest request) {

		return service.moreCommentList(request);
	}
	
	
	//댓글 저장
	@RequestMapping("/api/reserve/commentinsert")
	@ResponseBody
	public Map<String, Object> authCommentInsert(HttpServletRequest request) {

		return service.saveComment(request);
	}
	//테스트용-후에 삭제될 부분
	@RequestMapping("/reserve/private/comment_insert")
	public ModelAndView testCommentInsert(HttpServletRequest request, @RequestParam int ref_group) {

		service.testSaveComment(request);

		return new ModelAndView("redirect:/reserve/detail.do?num=" + ref_group);
	}
	
	
	//댓글 수정
	@RequestMapping("api/reserve/commentupdate")
	@ResponseBody
	public Map<String, Object> authCommentUpdate(ReserveCommentDto dto, HttpServletRequest request) {

		return service.updateComment(dto);
	}

	
	//댓글 삭제
	@RequestMapping("/api/reserve/commentdelete")
	@ResponseBody
	public Map<String, Object> authCommentDelete(HttpServletRequest request) {

		return service.deleteComment(request);
	}
	
	
	//예약 확인
	@RequestMapping("/api/reserve/checkedlist")
	@ResponseBody
	public List<ShelterDto> getCheckedList(){
		
		return service.getCheckedList();
	}
	
	
	//예약 확정
	@RequestMapping("/api/reserve/checkedyes")
	@ResponseBody
	public Map<String, Object> getCheckedY(HttpServletRequest request){
		
		return service.getCheckedY(request);
	}
	
	
	//예약 취소
	@RequestMapping("/api/reserve/checkedno")
	@ResponseBody
	public Map<String, Object> getCheckedN(HttpServletRequest request) {

		return service.getCheckedN(request);
	}
	
	
	@RequestMapping("/api/reserve/listallcount")
	@ResponseBody
	public List<ReserveCommentDto> getAllCount(){
		
		return service.getAllCount();
	}
	
}

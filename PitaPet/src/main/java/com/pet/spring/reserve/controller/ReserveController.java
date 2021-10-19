package com.pet.spring.reserve.controller;

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

import com.pet.spring.reserve.dto.ReserveCommentDto;
import com.pet.spring.reserve.dto.ReserveDto;
import com.pet.spring.reserve.service.ReserveService;
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
	public Map<String, Object> getListPaging(HttpServletRequest request){
		
		return service.getListPaging(request);
	}
 
   
	@RequestMapping("/reserve/private/insertform")
	public String authInsertForm(HttpServletRequest request) {

		return "reserve/insertform";
	}
	
	@RequestMapping("/api/reserve/insert")
	public String authInsert(ReserveDto dto, HttpServletRequest request) {

		service.insert(dto, request);
		
		return "redirect:/reserve/list.do";
	}
	
	
	@RequestMapping("/reserve/detailcheckform")
	public String detailCheckForm (HttpServletRequest request) {

		int num=(int)Integer.parseInt(request.getParameter("num"));
		//int pageNum=(int)Integer.parseInt(request.getParameter("pageNum")); 
		
		request.setAttribute("num", num);
		//request.setAttribute("pageNum", pageNum);
		
		return "reserve/detailcheckform";
	}

	@RequestMapping("/api/reserve/detailcheck")
	//@ResponseBody
	public String detailCheck (@RequestParam int num, @RequestParam java.lang.String pwd,
			HttpServletRequest request) {

		service.detailCheck(num, pwd, request);
		
		return "reserve/detailcheck";
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
	public String authUpdate(ReserveDto dto, HttpServletRequest request,
			@RequestParam int num) {

		service.update(dto);
		
		return "redirect:/reserve/detail.do?num="+num;
	}
	
	
	@RequestMapping("/api/reserve/delete")
	public String authDelete(@RequestParam int num) {

		service.delete(num);
		
		return "redirect:/reserve/list.do";
	}	
	
	
	//댓글 리스트
	@RequestMapping("/api/reserve/commentlist")
	@ResponseBody
	public List<ReserveCommentDto> ajaxCommentList(HttpServletRequest request) {

		return service.moreCommentList(request);
	}
	
	
	//댓글 저장
	@RequestMapping(value = "/api/reserve/commentinsert", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> authCommentInsert(HttpServletRequest request) {

		return service.saveComment(request);
	}
	//테스트용-후에 삭제될 부분
	@RequestMapping("/reserve/private/comment_insert")
	public String testCommentInsert(HttpServletRequest request, @RequestParam int ref_group) {
		
		service.testSaveComment(request);

		return "redirect:/reserve/detail.do?num=" + ref_group;
	}
	
	
	//댓글 수정
	@RequestMapping(value = "api/reserve/commentupdate", method = RequestMethod.POST)
	public String authCommentUpdate(ReserveCommentDto dto, HttpServletRequest request,
			@RequestParam int ref_group) {

		service.updateComment(dto);
		
		return "redirect:/reserve/detail.do?num="+ref_group;
	}

	
	//댓글 삭제
	@RequestMapping(value = "/api/reserve/commentdelete")
	public String authCommentDelete(HttpServletRequest request, @RequestParam int ref_group) {

		service.deleteComment(request);
		
		return "redirect:/reserve/detail.do?num="+ref_group;
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

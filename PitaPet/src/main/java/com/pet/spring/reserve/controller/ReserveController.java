package com.pet.spring.reserve.controller;

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

import com.pet.spring.reserve.dto.ReserveCommentDto;
import com.pet.spring.reserve.dto.ReserveDto;
import com.pet.spring.reserve.service.ReserveService;
import com.pet.spring.shelter.dto.ShelterDto;

@Controller
public class ReserveController {

	@Autowired
	private ReserveService service;
   
	
	@RequestMapping("/reserve/list")
	public String getList(HttpServletRequest request, HttpSession session) {

		/*
		//jsp 페이지 용
		
		//전체 게시글 목록
		service.getList(request);
		
		//전체 게시글에 달린 댓글 갯수
		List<ReserveCommentDto> dto2=service.getAllCount();
		request.setAttribute("allCount", dto2);
		
		String id=(String)session.getAttribute("id");
		request.setAttribute("id", id);
		
		//지점별 관리자 아이디
		List<ShelterDto> dto3=service.apiShelterList();
		request.setAttribute("checked", dto3);
		*/

		return "reserve/list";
	}
	@RequestMapping("api/reserve/list")
	@ResponseBody
	public List<ReserveDto> apiGetList(HttpServletRequest request) {

		return service.apiGetList(request);
	}
	
	@RequestMapping("/api/reserve/paging")
	@ResponseBody
	public Map<String, Object> apiPaging(HttpServletRequest request){
		
		return service.apiPaging(request);
	}
	
	
	/*
	@RequestMapping("/api/reserve/addViewCount")
	@ResponseBody
	public Map<String, Object> addViewCount(@RequestParam int num){
		
		return service.addViewCount(num);
	}
	*/
	
	@RequestMapping("/reserve/privatepwdform")
	public String privatePwdForm (HttpServletRequest request) {

		int num=(int)Integer.parseInt(request.getParameter("num"));
		request.setAttribute("num", num);
		
		return "reserve/privatepwdform";
	}

	@RequestMapping("/reserve/privatepwd")
	public String privatePwd (@RequestParam int num, @RequestParam java.lang.String pwd,
			HttpServletRequest request) {

		service.privatePwd(num, pwd, request);
		
		return "reserve/privatepwd";
	}
	
	
	@RequestMapping("/reserve/detail")
	public String detail(HttpServletRequest request) {

		int num=Integer.parseInt(request.getParameter("num"));
		//조회수 올리기
		service.addViewCount(num);
		
		//해당 게시글의 정보
		ReserveDto dto = service.getDetail(request);
		request.setAttribute("dto", dto);
		
		//해당 게시글의 전체 댓글 리스트
		service.commentList(request);
		
		//지점별 관리자 아이디
		List<ShelterDto> dto2=service.apiShelterList();
		request.setAttribute("checked", dto2);
		
		//전체 게시글에 달린 댓글 갯수
		List<ReserveCommentDto> commentCountList=service.getAllCount();
		request.setAttribute("commentCountList", commentCountList);

		return "reserve/detail";
	}
	/*
	@RequestMapping("/api/reserve/detail")
	@ResponseBody
	public ReserveDto apiDetail(HttpServletRequest request) {

		return service.getDetail(request);
	}
	*/
	
	//관리자-예약 확정 관리
	
	/*
	//지점별 관리자 아이디
	@RequestMapping("/api/reserve/shelterlist")
	@ResponseBody
	public List<ShelterDto> apiShelterList(){
				
		return service.apiShelterList();
	}
	*/
			
			
	//예약 확정
	@RequestMapping("/api/reserve/reserveyes")
	@ResponseBody
	public Map<String, Object> apiReserveY(HttpServletRequest request){
				
		return service.apiReserveY(request);
	}
			
			
	//예약 취소
	@RequestMapping("/api/reserve/reserveno")
	@ResponseBody
	public Map<String, Object> apiReserveN(HttpServletRequest request) {

		return service.apiReserveN(request);
	}

   
	@RequestMapping("/reserve/private/insertform")
	public String authInsertForm(HttpServletRequest request) {

		return "reserve/insertform";
	}
	
	@RequestMapping("/reserve/insert")
	public String authInsert(ReserveDto dto, HttpServletRequest request) {

		service.insert(dto, request);
		
		return "redirect:/reserve/list.do";
	}
	
	
	@RequestMapping("/reserve/private/updateform")
	public String updateform(HttpServletRequest request) {

		ReserveDto dto = service.getDetail(request);
		request.setAttribute("dto", dto);

		return "reserve/updateform";
	}

	@RequestMapping("/reserve/update")
	public String authUpdate(ReserveDto dto, HttpServletRequest request,
			@RequestParam int num) {

		service.update(dto);
		
		return "redirect:/reserve/detail.do?num="+num;
	}
	
	
	@RequestMapping("/reserve/delete")
	public String authDelete(@RequestParam int num) {

		service.delete(num);
		
		return "redirect:/reserve/list.do";
	}	
	
	
	//댓글
	
	/*
	@RequestMapping("/api/reserve/commentlist")
	@ResponseBody
	public List<ReserveCommentDto> apiCommentList(HttpServletRequest request) {

		return service.apiCommentList(request);
	}
	*/
	
	
	@RequestMapping("/reserve/private/commentinsert")
	public String commentInsert(HttpServletRequest request, @RequestParam int ref_group) {
		
		service.insertComment(request);

		return "redirect:/reserve/detail.do?num=" + ref_group;
	}
	/*
	@RequestMapping(value = "/api/reserve/commentinsert", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> apiCommentInsert(HttpServletRequest request) {

		return service.apiInsertComment(request);
	}
	*/
	
	
	@RequestMapping(value = "api/reserve/commentupdate", method = RequestMethod.POST)
	public String authCommentUpdate(ReserveCommentDto dto, HttpServletRequest request,
			@RequestParam int ref_group) {

		service.updateComment(dto);
		
		return "redirect:/reserve/detail.do?num="+ref_group;
	}

	
	@RequestMapping("/api/reserve/commentdelete")
	public String authCommentDelete(HttpServletRequest request, @RequestParam int ref_group) {

		service.deleteComment(request);
		
		return "redirect:/reserve/detail.do?num="+ref_group;
	}
	
	
	//전체 게시글에 달린 댓글 갯수
	@RequestMapping("/api/reserve/commentallcount")
	@ResponseBody
	public List<ReserveCommentDto> getAllCount(){
		
		return service.getAllCount();
	}
	
}

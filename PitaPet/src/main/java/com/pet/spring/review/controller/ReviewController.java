package com.pet.spring.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.spring.adopt.dto.AdoptDto;
import com.pet.spring.review.dao.ReviewDao;
import com.pet.spring.review.dto.ReviewCommentDto;
import com.pet.spring.review.dto.ReviewDto;
import com.pet.spring.review.service.ReviewService;

@Controller
public class ReviewController {
   @Autowired private ReviewService service;
   @Autowired private ReviewDao dao;
   
   
   // (Vue) 댓글 목록
   @RequestMapping("/api/review/ajax_comment_list")
   @ResponseBody
   public List<ReviewCommentDto> ajaxCommentList(HttpServletRequest request) {
      return service.moreCommentList(request);
   }
   
   // (Vue) 댓글 페이징
   @RequestMapping("/api/review/commentPaging")
   public Map<String, Object> commentPaging(HttpServletRequest request){
	   return service.commentPaging(request);
   }
   
   // (Vue) 댓글 추가, 수정, 삭제
   @RequestMapping(value ="/api/review/comment_insert", method = RequestMethod.POST)
   @ResponseBody
	public Map<String, Object> commentInsert(HttpServletRequest request, @RequestParam int ref_group) {
	   service.saveComment(request);   
	   Map<String, Object> map=new HashMap<String, Object>();
      map.put("isSuccess", true);
      return map;
	}
   
   @RequestMapping("/api/review/comment_update")
   @ResponseBody
   public Map<String, Object> commentUpdate(ReviewCommentDto dto){
      service.updateComment(dto);
      Map<String, Object> map=new HashMap<String, Object>();
      map.put("isSuccess", true);
      return map;
   }
   
   @RequestMapping(value ="/api/review/comment_delete", method = RequestMethod.POST)
   @ResponseBody
   public Map<String, Object> commentDelete(HttpServletRequest request){
      service.deleteComment(request);
      Map<String, Object> map=new HashMap<String, Object>();
      map.put("isSuccess", true);
      return map;
   }
   
   
   // (Vue) 게시글 하단 페이징 처리에 필요한 데이터 리턴하는 메소드
   @RequestMapping("/api/review/paging")
   @ResponseBody
   public Map<String, Object> paging(HttpServletRequest request){
	   
	   int pageNum=Integer.parseInt(request.getParameter("pageNum"));
	   String animalType=(String)request.getParameter("animalType");
	   
	   final int PAGE_ROW_COUNT=8;
	   final int PAGE_DISPLAY_COUNT=5;
	      
	   //하단 시작 페이지 번호
	   int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
	   //하단 끝 페이지 번호
	   int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
	   
	   if (animalType == null) {
		   animalType = "";
		}
		
	   ReviewDto dto = new ReviewDto();
	    
		if(!animalType.equals("")) {
			if (!animalType.equals("선택하기")) {
				dto.setAnimalType(animalType);
			}
		}
	   
	   //전체 Row의 개수
	   int totalRow=dao.getCount(dto);
	   //전체 페이지 개수 구하기
	   int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
	   
	   //끝 페이지 번호가 전체 페이지의 갯수보다 크다면 잘못된 값이므로 보정해주기
	   if(endPageNum > totalPageCount){
	         endPageNum = totalPageCount; 
	   }
	   
	   //json 문자열로 응답할 데이터를 Map 에 담기
	   Map<String, Object> map=new HashMap<String, Object>();
	   map.put("startPageNum", startPageNum);
	   map.put("endPageNum", endPageNum);
	   map.put("totalPageCount", totalPageCount);
	   
	   return map;
	   
   }
   
   // (Vue) 게시글 목록을 json으로 응답
   @RequestMapping("/api/review/list")
   @ResponseBody
   public List<ReviewDto> getList2(HttpServletRequest request){
	   return service.getList2(request);
   }
   
   // (Vue) 게시글 하나의 정보를 json 으로 응답
   @RequestMapping("/api/review/detail")
   @ResponseBody
   public ReviewDto getDetail(HttpServletRequest request) {
	   
	   int num=Integer.parseInt(request.getParameter("num"));
	   String animalType = request.getParameter("animalType");

	   if (animalType == null) {
		   animalType = "";
	   }

	   ReviewDto dto=new ReviewDto();
	   dto.setNum(num);

	   if (!animalType.equals("")) {
		   if (!animalType.equals("선택하기")) {
			   dto.setAnimalType(animalType);
		   }
	   }
	   
	   return dao.getData(dto);
   }
   
   @RequestMapping("/review/list")
   public String getList(HttpServletRequest request) {
      service.getList(request);
      return "review/list";
   }
   
   @RequestMapping("/review/detail")
   public String detail(HttpServletRequest request) {
      service.getDetail(request);
      return "review/detail";
   }
   
   //게시글 (추가, 수정, 삭제)
   @RequestMapping("/review/private/insertform")
   public String insertForm() {
      return "review/insertform";
   }
   
   @RequestMapping("/review/private/insert")
   public String insert(ReviewDto dto, HttpServletRequest request) {
	   String id = (String)request.getSession().getAttribute("id");
	   dto.setWriter(id);
	   service.saveContent(dto, request);
	   return "review/insert";
   }
   
   @RequestMapping("/review/private/updateform")
   public String updateForm(HttpServletRequest request) {
      service.getData(request);
      return "review/updateform";
   }
   
   @RequestMapping(value = "/review/private/update", method = RequestMethod.POST)
   public String update(ReviewDto dto) {
      service.updateContent(dto);
      return "review/update";
   }
   
   @RequestMapping("/review/private/delete")
   public String delete(HttpServletRequest request, @RequestParam int num) {
      service.deleteContent(num, request);
      return "redirect:/review/list.do";
   }

}

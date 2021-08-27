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

import com.pet.spring.review.dao.ReviewDao;
import com.pet.spring.review.dto.ReviewCommentDto;
import com.pet.spring.review.dto.ReviewDto;
import com.pet.spring.review.service.ReviewService;

@Controller
public class ReviewController {
   @Autowired private ReviewService service;
   @Autowired private ReviewDao dao;
   
   //게시글 목록을 json으로 응답 (Vue)
   @RequestMapping("/api/review/list")
   @ResponseBody
   public List<ReviewDto> getList2(HttpServletRequest request){
	   return service.getList2(request);
   }
   
   //게시글 하나의 정보를 json 으로 응답 (Vue)
   @RequestMapping("/api/review/detail")
   @ResponseBody
   public ReviewDto detail(@RequestParam int num) {
	   return dao.getData(num);
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
   
   //댓글 목록
   @RequestMapping("/review/ajax_comment_list")
   public String ajaxCommentList(HttpServletRequest request) {
      service.moreCommentList(request);
      return "review/ajax_comment_list";
   }
   
   //댓글 (추가, 수정, 삭제)
   @RequestMapping("/review/private/comment_insert")
	public String commentInsert(HttpServletRequest request, @RequestParam int ref_group) {
		service.saveComment(request);
		return "redirect:/review/detail.do?num="+ref_group;
	}
   
   @RequestMapping("/review/private/comment_update")
   @ResponseBody
   public Map<String, Object> commentUpdate(ReviewCommentDto dto){
      service.updateComment(dto);
      Map<String, Object> map=new HashMap<String, Object>();
      map.put("isSuccess", true);
      return map;
   }
   
   @RequestMapping("/review/private/comment_delete")
   @ResponseBody
   public Map<String, Object> commentDelete(HttpServletRequest request){
      service.deleteComment(request);
      Map<String, Object> map=new HashMap<String, Object>();
      map.put("isSuccess", true);
      return map;
   }

}

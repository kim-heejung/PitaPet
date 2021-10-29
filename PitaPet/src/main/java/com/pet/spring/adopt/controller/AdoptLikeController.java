package com.pet.spring.adopt.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pet.spring.adopt.service.AdoptLikeService;

@Controller
public class AdoptLikeController {
	
	@Autowired
	private AdoptLikeService service;
	
	
	/*
	//아이디별 해당 게시글에 좋아요 insert 됐는지 확인용
	@RequestMapping("/api/adoptlike/isexist")
    @ResponseBody
    public int isExist(HttpServletRequest request){
    
       return service.isExist(request);
    }
    */
	
	@RequestMapping("/adoptlike/like")
	public String likeInsert(HttpServletRequest request) {
		
		int num=Integer.parseInt(request.getParameter("num"));
		//아이디별 해당 게시글에 좋아요 insert 됐는지 확인용
		int isExist=service.isExist(request);
		
		if(isExist < 1) {
			//좋아요 처음 클릭 시 칼럼 생성
			service.likeInsert(request);
		}else {
			//좋아요 재등록(수정)
			service.likeUpdateY(request);
		}
		
		return "redirect:/adopt/detail.do?num="+num;
	}
	/*
	@RequestMapping(value="/api/adoptlike/insert", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> apiLikeInsert(HttpServletRequest request){
		
		return service.apiLikeInsert(request);
	}
	*/

  
	/*
	//좋아요 재등록(수정)
	@RequestMapping(value="/api/adoptlike/updateyes", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> apiLikeUpdateY(HttpServletRequest request){
		
		service.apiLikeUpdateY(request);
		
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		
		return map;
	}
	*/
	
	//좋아요 취소
	@RequestMapping("/adoptlike/unlike")
	public String likeUpdateN(HttpServletRequest request){
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		service.likeUpdateN(request);
		
		return "redirect:/adopt/detail.do?num="+num;
	}
	 
	
	/*
	//게시글 전체의 좋아요 갯수
	@RequestMapping("/api/adoptlike/countlist")
	@ResponseBody
	public List<AdoptLikeDto> apiLikeCountList(){
			
		return service.apiLikeCountList();
	}
	*/
	
	
	/*
	//아이디별 해당 게시글의 좋아요 여부
	@RequestMapping("/api/adoptlike/checked")
	@ResponseBody
	public AdoptLikeDto likeGetData(HttpServletRequest request){
		 
		return service.likeGetData(request);
	}
	*/
	
	
	/*
	//해당 게시글의 좋아요 갯수
	@RequestMapping("/api/adoptlike/count")
	@ResponseBody
	public Map<String, Object> apiLikeCount(@RequestParam int num){
		
		return service.apiLikeCount(num);
	}
	*/
	
}

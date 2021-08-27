package com.pet.spring.adopt.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.pet.spring.adopt.dao.AdoptLikeDao;
import com.pet.spring.adopt.dto.AdoptLikeDto;

@Service
public class AdoptLikeServiceImpl implements AdoptLikeService {

	@Autowired
	private AdoptLikeDao dao;
	/*
	@Override
	public void insert(HttpServletRequest request) {
		
		AdoptLikeDto dto=new AdoptLikeDto();
		
		int num=Integer.parseInt(request.getParameter("num"));
		String id=(String)request.getSession().getAttribute("id");	
		
		dto.setNum(num);
		dto.setId(id);
		
		int count=dao.isExist(dto);
		if( count<1 ){
			dao.insert(dto);
		}
		
	}

	@Override
	public Map<String, Object> updateY(HttpServletRequest request) {
		
		int num=Integer.parseInt(request.getParameter("num"));
		String id=(String)request.getSession().getAttribute("id");
		
		AdoptLikeDto dto=new AdoptLikeDto();
		dto.setNum(num);
		dto.setId(id);
		
		dao.updateY(dto);
		
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}

	@Override
	public Map<String, Object> updateN(HttpServletRequest request) {
		
		int num=Integer.parseInt(request.getParameter("num"));
		String id=(String)request.getSession().getAttribute("id");
		
		AdoptLikeDto dto=new AdoptLikeDto();
		dto.setNum(num);
		dto.setId(id);
		
		dao.updateN(dto);
		
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
		
	}
	
	public List<AdoptLikeDto> getYCountList(){
		
		List<AdoptLikeDto> list=dao.getYCountList();
		
		return list;
	}
	//테스트용
	public List<AdoptLikeDto> testGetYCountList(HttpServletRequest request){
		
		List<AdoptLikeDto> list=dao.getYCountList();
		
		
		request.setAttribute("likeCountList", list);
		
		return list;
	}
	*/
	/*
	//테스트용 
	public List<AdoptLikeDto> testGetYList(HttpSession session){
		
		String id=(String)session.getAttribute("id");
		
		AdoptLikeDto dto=new AdoptLikeDto();
		dto.setId(id);
		
		List<AdoptLikeDto> list=dao.getYList(id);
		
		return list;
	}
	*/
	
	/*
	@Override
	public AdoptLikeDto getData(HttpServletRequest request) {
		
		int num=Integer.parseInt(request.getParameter("num"));
		String id=(String)request.getSession().getAttribute("id");
		
		AdoptLikeDto dto=new AdoptLikeDto();
		dto.setNum(num);
		dto.setId(id);
		
		AdoptLikeDto dto2=dao.getData(dto);
		
		return dto2;
		
	}
	//테스트용
	@Override
	public void testGetData(HttpServletRequest request) {
		
		int num=Integer.parseInt(request.getParameter("num"));
		String id=(String)request.getSession().getAttribute("id");
		
		AdoptLikeDto dto=new AdoptLikeDto();
		dto.setNum(num);
		dto.setId(id);
		
		dao.updateN(dto);
		
		request.setAttribute("likeDto", dto);
		
	}

	@Override
	public Map<String, Object> getCount(int num) {
		
		int count=dao.getCount(num);
		
		Map<String, Object> map=new HashMap<>();
		map.put("count", count);
		
		return map;
	}

	@Override
	public List<AdoptLikeDto> getMyList(HttpSession session) {
		
		String id=(String)session.getAttribute("id");
		
		List<AdoptLikeDto> list=dao.getMyList(id);
		
		return list;
	}
	*/
}

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
	
	
	@Override
	public Map<String, Object> insert(HttpServletRequest request) {
		
		AdoptLikeDto dto=new AdoptLikeDto();
		
		int num=Integer.parseInt(request.getParameter("num"));
		String id=(String)request.getSession().getAttribute("id");	
		
		dto.setNum(num);
		dto.setId(id);
		
		dao.insert(dto);
		
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		
		return map; 
		
	}
	//테스트용-후에 삭제될 부분
	@Override
	public void testInsert(HttpServletRequest request) {
		
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

		int num = Integer.parseInt(request.getParameter("num"));
		String id = (String) request.getSession().getAttribute("id");

		AdoptLikeDto dto = new AdoptLikeDto();
		dto.setNum(num);
		dto.setId(id);

		dao.updateY(dto);

		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}
	//테스트용-후에 삭제될 부분
	@Override
	public void testUpdateY(HttpServletRequest request) {
		
		int num=Integer.parseInt(request.getParameter("num"));
		String id=(String)request.getSession().getAttribute("id");
		
		AdoptLikeDto dto=new AdoptLikeDto();
		dto.setNum(num);
		dto.setId(id);
		
		dao.updateY(dto);
		
	}
	
	@Override
	public void updateN(HttpServletRequest request) {
		
		int num=Integer.parseInt(request.getParameter("num"));
		String id=(String)request.getSession().getAttribute("id");
		
		AdoptLikeDto dto=new AdoptLikeDto();
		dto.setNum(num);
		dto.setId(id);
		
		dao.updateN(dto);
	}
	
	
	public List<AdoptLikeDto> getYCountList(){
		
		List<AdoptLikeDto> list=dao.getYCountList();
		
		return list;
	}
	//테스트용-후에 삭제될 부분
	public List<AdoptLikeDto> testGetYCountList(HttpServletRequest request){
		
		List<AdoptLikeDto> list=dao.getYCountList();
		
		request.setAttribute("likeCountList", list);
		
		return list;
	}
	
	
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

	
	@Override
	public Map<String, Object> getCount(int num) {
		
		int count=dao.getCount(num);
		
		Map<String, Object> map=new HashMap<>();
		map.put("count", count);
		
		return map;
	}
	//테스트용-후에 삭제될 부분
	@Override
	public int getTestCount(int num) {
		
		int count=dao.getCount(num);
		
		return count;
	}
	
	
	@Override
	public int isExist(HttpServletRequest request) {
		
		int num=Integer.parseInt(request.getParameter("num"));
		String id=(String)request.getSession().getAttribute("id");
		
		AdoptLikeDto dto=new AdoptLikeDto();
		dto.setNum(num);
		dto.setId(id);
		
		int count=dao.isExist(dto);
		
		return count;
	}
	
}

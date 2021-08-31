package com.pet.spring.adopt.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.pet.spring.adopt.dto.ReserveDto;

public interface ReserveService {

	public List<ReserveDto> getList(HttpServletRequest request);
	//테스트용-후에 삭제될 부분
	public List<ReserveDto> testGetList(HttpServletRequest request);
	
	public Map<String, Object> getListPaging(int pageNum);
	
	public Map<String, Object> insert(ReserveDto dto, HttpServletRequest request);

	public ReserveDto getDetail(HttpServletRequest request); 
	
	public Map<String, Object> update(ReserveDto dto);
   
	public Map<String, Object> delete(int num);
  
}

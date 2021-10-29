package com.pet.spring.adopt.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pet.spring.adopt.dto.AdoptDto;

public interface AdoptService {
	
	public List<AdoptDto> apiGetList(HttpServletRequest request);
	//public void getList(HttpServletRequest request);
	public Map<String, Object> apiPaging(HttpServletRequest request);
	public Map<String, Object> addViewCount(int num);
	public AdoptDto detail(HttpServletRequest request);
	//public AdoptDto apiDetail(HttpServletRequest request);
	public void insert(AdoptDto dto, HttpServletRequest request);
	//수정할 해당 게시글의 정보
	public AdoptDto updateDetail(HttpServletRequest request);
	public void update(AdoptDto dto, HttpServletRequest request);
	public void delete(int num);
	
	//생일 메인 노출
	public AdoptDto apiBirthData();
	public List<AdoptDto> apiBirthList();
	
}

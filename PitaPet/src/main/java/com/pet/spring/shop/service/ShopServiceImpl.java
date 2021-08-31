package com.pet.spring.shop.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.spring.shop.dao.ShopDao;
import com.pet.spring.shop.dto.ShopDto;

@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	private ShopDao dao;

	@Override
	public void getList(ModelAndView mView,HttpServletRequest request) {
		final int PAGE_ROW_COUNT=12;
	    final int PAGE_DISPLAY_COUNT=5;
		
	    int pageNum=1;
	    String strPageNum = request.getParameter("pageNum");
	    if(strPageNum != null){
	       pageNum=Integer.parseInt(strPageNum);
	    }
	    
	    int startRowNum = 1 + (pageNum-1) * PAGE_ROW_COUNT;
	    int endRowNum = pageNum * PAGE_ROW_COUNT;
	    
	    String category=request.getParameter("category");
	    
		ShopDto dto=new ShopDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		if(category!=null){
			dto.setCategory(category);
		}
		
		List<ShopDto> list=dao.getList(dto);
		
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;

	    int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;

	    int totalRow = dao.getCount();

	    int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
	    if(endPageNum > totalPageCount){
	       endPageNum = totalPageCount; 
	    }
		
		mView.addObject("list", list);
		mView.addObject("startPageNum", startPageNum);
		mView.addObject("endPageNum", endPageNum);
		mView.addObject("category", category);
		mView.addObject("totalPageCount", totalPageCount);
		mView.addObject("totalRow", totalRow);
	}

	@Override
	public void insert(ShopDto dto) {
		dao.insert(dto);
	}
	
	@Override
	public Map<String,Object> uploadAjaxImage(ShopDto dto, HttpServletRequest request){
		MultipartFile image=dto.getImage();
	      String orgFileName = image.getOriginalFilename();

	      String realPath = request.getServletContext().getRealPath("/upload");

	      String filePath = realPath + File.separator;

	      File upload = new File(filePath);
	      if(!upload.exists()) {
	         upload.mkdir();
	      }
	      
	      String saveFileName = System.currentTimeMillis() + orgFileName;
	      
	      try {
	         image.transferTo(new File(filePath + saveFileName));
	         System.out.println();   
	      }catch(Exception e) {
	         e.printStackTrace();
	      }

	      String imgPath = "/upload/" + saveFileName;
	      
	      //ajax upload 를 위한 imagePath return
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("imgPath", imgPath);
	      
	      return map;
	}


}

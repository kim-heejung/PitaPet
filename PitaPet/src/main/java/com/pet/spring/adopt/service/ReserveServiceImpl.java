package com.pet.spring.adopt.service;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.spring.adopt.dao.ReserveDao;
import com.pet.spring.adopt.dto.AdoptDto;
import com.pet.spring.adopt.dto.ReserveDto;

@Service
public class ReserveServiceImpl implements ReserveService {

   @Autowired
   private ReserveDao dao;

   /*
	@Override
	public List<ReserveDto> getList(HttpServletRequest request, int num) {

		// 한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT = 8;
		// 하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT = 5;

		// 보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int pageNum = 1;
		// 페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum = request.getParameter("pageNum");
		// 만일 페이지 번호가 파라미터로 넘어 온다면
		if (strPageNum != null) {
			// 숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum = Integer.parseInt(strPageNum);
		}

		// 보여줄 페이지의 시작 ROWNUM
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		// 보여줄 페이지의 끝 ROWNUM
		int endRowNum = pageNum * PAGE_ROW_COUNT;
		
		String id=(String)request.getSession().getAttribute("id");

		// startRowNum 과 endRowNum 을 GalleryDto 객체에 담고
		ReserveDto dto = new ReserveDto();
		dto.setNum(num);
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		dto.setId(id);
		

		// GalleryDao 객체를 이용해서 회원 목록을 얻어온다.
		List<ReserveDto> list = dao.getList(dto);

		return list;
	}
	// 테스트용
	@Override
	public List<ReserveDto> testGetList(HttpServletRequest request) {

		// 한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT = 5;
		// 하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT = 5;

		// 보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int pageNum = 1;
		// 페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum = request.getParameter("pageNum");
		// 만일 페이지 번호가 파라미터로 넘어 온다면
		if (strPageNum != null) {
			// 숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum = Integer.parseInt(strPageNum);
		}
		// 페이지번호를 get 방식으로 달고와서 해당 페이지 번호를 보여줌.

		// 보여줄 페이지의 시작 ROWNUM
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		// 보여줄 페이지의 끝 ROWNUM
		int endRowNum = pageNum * PAGE_ROW_COUNT;

		String id=(String)request.getSession().getAttribute("id");
		int num=Integer.parseInt(request.getParameter("num"));
		
		// String id=(String)session.getAttribute("id");

		// CafeDto 객체에 startRowNum 과 endRowNum 을 담는다.
		ReserveDto dto = new ReserveDto();
		dto.setNum(num);
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		dto.setId(id);

		// ArrayList 객체의 참조값을 담을 지역변수를 미리 만든다.
		List<ReserveDto> list = null;

		list = dao.getList(dto);
		// 키워드가 없을때 호출하는 메소드를 이용해서 전제 row 의 갯수를 얻어온다.
		int totalRow = dao.getCount(dto);

		// 하단 시작 페이지 번호
		int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		// 하단 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;

		// 전체 페이지의 갯수
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
		// 끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
		if (endPageNum > totalPageCount) {
			endPageNum = totalPageCount; // 보정해 준다.
		}

		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);

		return list;
	}

	
	@Override
	public Map<String, Object> insert(ReserveDto dto, HttpServletRequest request) {

		// adopt detail 페이지에서 num, shelterName 얻어오기.


		int num=Integer.parseInt(request.getParameter("num"));
		String id = (String) request.getSession().getAttribute("id");

		dto.setNum(num);
		dto.setId(id);
		// dto.setShelterName(shelterName);
		dao.insert(dto);
		
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		
		return map;
	}*/
   /*
   @Override
   public void insert(ReserveDto dto) {
      
      dao.insert(dto);
      
   }
   */
	
	/*
   @Override
   public void getDetail(HttpServletRequest request) {

      // 자세히 보여줄 글번호를 읽어온다.
      int num = Integer.parseInt(request.getParameter("num"));
      // 조회수 올리기
      dao.addViewCount(num);
      ReserveDto dto = dao.getData(num);  
      request.setAttribute("dto", dto);
      
   }*/
   /*
	@Override
	public ReserveDto getDetail(HttpServletRequest request) {

		// 자세히 보여줄 글번호를 읽어온다.
		int num = Integer.parseInt(request.getParameter("num"));
		// 조회수 올리기
		dao.addViewCount(num);
		ReserveDto dto = dao.getData(num);

		return dto;
		
	}
	   
   
   
   @Override
   public Map<String, Object> update(ReserveDto dto) {
      
      dao.update(dto);
      
      Map<String, Object> map=new HashMap<>();
	  map.put("isSuccess", true);
      
      return map;
      
   }

   */
   /*
   @Override
   public Map<String, Object> delete(int num, HttpServletRequest request) {
      

      // 세션에서 로그인된 아이디를 읽어와서
      //String id=(String)request.getSession().getAttribute("id");
      // 삭제할 글의 작성자
      //String writer=dao.getData(num).getId();
      // 만일 글의 작성자가 로그인된 아이디와 다르면
       */
      /*
      if(! writer.equals(id)) {
         // spring 에서는 service 에서 직접 응답해버리면 로직이 꼬이기 때문에
         // 예외를 발생시켜서 응답을 예외 Controller 에서 하도록 한다.
         throw new NotDeleteException("남의 파일 지우기 없기!");
         // runtimeexception 을 상속 받았기 때문에 try, catch 문으로 묶지 않아도 됨.
      }
      */
   /*
      dao.delete(num); 
      
      Map<String, Object> map=new HashMap<>();
	  map.put("isSuccess", true);
      
      return map;
      
   }
*/

}
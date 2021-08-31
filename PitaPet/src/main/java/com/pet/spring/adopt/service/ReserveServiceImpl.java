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

   
	@Override
	public List<ReserveDto> getList(HttpServletRequest request) {

		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT = 8;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT = 5;

		//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int pageNum = 1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum = request.getParameter("pageNum");
		//만일 페이지 번호가 파라미터로 넘어 온다면
		if (strPageNum != null) {
			// 숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum = Integer.parseInt(strPageNum);
		}

		//보여줄 페이지의 시작 ROWNUM
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum = pageNum * PAGE_ROW_COUNT;
		
		ReserveDto dto = new ReserveDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);

		List<ReserveDto> list = dao.getList(dto);

		return list;
	}
	//테스트용-후에 삭제될 부분
	@Override
	public List<ReserveDto> testGetList(HttpServletRequest request) {

		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT = 5;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT = 5;

		//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int pageNum = 1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum = request.getParameter("pageNum");
		//만일 페이지 번호가 파라미터로 넘어 온다면
		if (strPageNum != null) {
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum = Integer.parseInt(strPageNum);
		}
		//페이지번호를 get 방식으로 달고와서 해당 페이지 번호를 보여줌.

		//보여줄 페이지의 시작 ROWNUM
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum = pageNum * PAGE_ROW_COUNT;

		ReserveDto dto = new ReserveDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);

		List<ReserveDto> list = null;

		list = dao.getList(dto);
		// 키워드가 없을때 호출하는 메소드를 이용해서 전제 row 의 갯수를 얻어온다.
		int totalRow = dao.getCount();

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

		//테스트용-후에 삭제될 부분
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);

		return list;
	}
	
	@Override
	public Map<String, Object> getListPaging(int pageNum) {
		
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT = 8;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT = 5;

		//하단 시작 페이지 번호
		int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;

		//전체 row 의 갯수
		int totalRow = dao.getCount();
		//전체 페이지의 갯수 구하기
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
		// 끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
		if (endPageNum > totalPageCount) {
			endPageNum = totalPageCount; //보정해 준다.
		}
		//json 문자열로 응답할 데이터를 일단 Map 에 담는다.
		Map<String, Object> map = new HashMap<>();
		map.put("startPageNum", startPageNum);
		map.put("endPageNum", endPageNum);
		map.put("totalPageCount", totalPageCount);
		
		return map;
	};

	
	@Override
	public Map<String, Object> insert(ReserveDto dto, HttpServletRequest request) {

		String id =(String)request.getSession().getAttribute("id");

		dto.setWriter(id);
		dao.insert(dto);
		
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		
		return map;
	}
  

	@Override
	public ReserveDto getDetail(HttpServletRequest request) {

		//자세히 보여줄 글번호를 읽어온다.
		int num = Integer.parseInt(request.getParameter("num"));
		//조회수 올리기
		dao.addViewCount(num);
		ReserveDto dto = dao.getData(num);

		return dto;
	}
	   
   
	@Override
	public Map<String, Object> update(ReserveDto dto) {

		dao.update(dto);

		Map<String, Object> map = new HashMap<>();
		map.put("isSuccess", true);

		return map;

	} 
	
	
	@Override
	public Map<String, Object> delete(int num) {

		dao.delete(num);

		Map<String, Object> map = new HashMap<>();
		map.put("isSuccess", true);

		return map;
	}

}
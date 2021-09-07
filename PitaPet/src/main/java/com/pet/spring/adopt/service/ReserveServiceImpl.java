package com.pet.spring.adopt.service;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.spring.adopt.dao.ReserveCommentDao;
import com.pet.spring.adopt.dao.ReserveDao;
import com.pet.spring.adopt.dto.AdoptDto;
import com.pet.spring.adopt.dto.ReserveCommentDto;
import com.pet.spring.adopt.dto.ReserveDto;
import com.pet.spring.shelter.dto.ShelterDto;

@Service
public class ReserveServiceImpl implements ReserveService {

	@Autowired
	private ReserveDao dao;
	@Autowired
	private ReserveCommentDao commentDao;

	
   
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
		final int PAGE_ROW_COUNT = 8;
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
	public Map<String, Object> addViewCount(int num) {
		
		dao.addViewCount(num);
		
		Map<String, Object> map = new HashMap<>();
		map.put("isSuccess", true);
		
		return map;
	}
	
	@Override
	public ReserveDto getDetail(HttpServletRequest request) {

		//자세히 보여줄 글번호를 읽어온다.
		int num = Integer.parseInt(request.getParameter("num"));
		
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
	
	
	//댓글 리스트
	@Override
	public List<ReserveCommentDto> moreCommentList(HttpServletRequest request) {
		
		String id = (String) request.getSession().getAttribute("id");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int num = Integer.parseInt(request.getParameter("num"));

		/*
		 * [ 댓글 페이징 처리에 관련된 로직 ]
		 */
		// 한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT = 10;

		// 보여줄 페이지의 시작 ROWNUM
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		// 보여줄 페이지의 끝 ROWNUM
		int endRowNum = pageNum * PAGE_ROW_COUNT;

		// 원글의 글번호를 이용해서 해당글에 달린 댓글 목록을 얻어온다.
		ReserveCommentDto commentDto = new ReserveCommentDto();
		commentDto.setRef_group(num);
		// 1 페이지에 해당하는 startRowNum 과 endRowNum 을 dto 에 담아서
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);

		// 1 페이지에 해당하는 댓글 목록만 select 되도록한다.
		List<ReserveCommentDto> commentList = commentDao.getList(commentDto);

		// 원글의 글번호를 이용해서 댓글 전체의 갯수를 얻어낸다.
		int totalRow = commentDao.getCount(num);
		// 댓글 전체 페이지의 갯수
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);

		return commentList;
		
	}
	//테스트용-후에 삭제될 부분
	@Override
	public void testMoreCommentList(HttpServletRequest request) {
		
		// 로그인된 아이디
		String id = (String) request.getSession().getAttribute("id");
		// ajax 요청 파라미터로 넘어오는 댓글의 페이지 번호를 읽어낸다.
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		// ajax 이용해서 pageNum 으로 current 를 넘겨줘서
		// ajax 요청 파라미터로 넘어오는 원글의 페이지 번호를 읽어낸다.
		int num = Integer.parseInt(request.getParameter("num"));

		/*
		 * [ 댓글 페이징 처리에 관련된 로직 ]
		 */
		// 한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT = 10;

		// 보여줄 페이지의 시작 ROWNUM
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		// 보여줄 페이지의 끝 ROWNUM
		int endRowNum = pageNum * PAGE_ROW_COUNT;

		// 원글의 글번호를 이용해서 해당글에 달린 댓글 목록을 얻어온다.
		ReserveCommentDto commentDto = new ReserveCommentDto();
		commentDto.setRef_group(num);
		// 1 페이지에 해당하는 startRowNum 과 endRowNum 을 dto 에 담아서
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);

		// 1 페이지에 해당하는 댓글 목록만 select 되도록한다.
		List<ReserveCommentDto> commentList = commentDao.getList(commentDto);

		// 원글의 글번호를 이용해서 댓글 전체의 갯수를 얻어낸다.
		int totalRow = commentDao.getCount(num);
		// 댓글 전체 페이지의 갯수
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);

		// view page 에 필요한 값 request 에 담아주기
		request.setAttribute("commentList", commentList);
		request.setAttribute("num", num); // 원글의 글번호
		request.setAttribute("pageNum", pageNum); // 댓글의 페이지 번호
	}
	
	
	//댓글 저장
	@Override
	public Map<String, Object> saveComment(HttpServletRequest request) {
		
		int ref_group = Integer.parseInt(request.getParameter("ref_group"));
		String target_id = request.getParameter("target_id");
		String content = request.getParameter("content");
		/*
		 * 원글의 댓글은 comment_group 번호가 전송이 안되고 댓글의 댓글은 comment_group 번호가 전송이 된다. 따라서 null
		 * 여부를 조사하면 원글의 댓글인지 댓글의 댓글인지 판단할수 있다.
		 */
		String comment_group = request.getParameter("comment_group");

		// 댓글 작성자는 session 영역에서 얻어내기
		String writer = (String) request.getSession().getAttribute("id");
		// request 에서 getSession 메소드 사용해서 session 영역에 id 를 얻어낼 수 있음.
		// 댓글의 시퀀스 번호 미리 얻어내기
		int seq = commentDao.getSequence();
		// 저장할 댓글의 정보를 dto 에 담기
		ReserveCommentDto dto = new ReserveCommentDto();
		dto.setNum(seq);
		dto.setWriter(writer);
		dto.setTarget_id(target_id);
		dto.setContent(content);
		dto.setRef_group(ref_group);
		// 원글의 댓글인경우
		if (comment_group == null) { // 원글에 댓글을 달면
			// 댓글의 글번호를 comment_group 번호로 사용한다.
			dto.setComment_group(seq);
		} else { // 댓글의 대댓글을 달면
			// 전송된 comment_group 번호를 숫자로 바꾸서 dto 에 넣어준다.
			dto.setComment_group(Integer.parseInt(comment_group));
		}
		// 댓글 정보를 DB 에 저장하기
		commentDao.insert(dto);
		
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		
		return map;
	}
	//테스트용-후에 삭제될 부분
	@Override
	public void testSaveComment(HttpServletRequest request) {
		// 폼 전송되는 파라미터 추출
		int ref_group = Integer.parseInt(request.getParameter("ref_group"));
		String target_id = request.getParameter("target_id");
		String content = request.getParameter("content");
		/*
		 * 원글의 댓글은 comment_group 번호가 전송이 안되고 댓글의 댓글은 comment_group 번호가 전송이 된다. 따라서 null
		 * 여부를 조사하면 원글의 댓글인지 댓글의 댓글인지 판단할수 있다.
		 */
		String comment_group = request.getParameter("comment_group");

		// 댓글 작성자는 session 영역에서 얻어내기
		String writer = (String) request.getSession().getAttribute("id");
		// request 에서 getSession 메소드 사용해서 session 영역에 id 를 얻어낼 수 있음.
		// 댓글의 시퀀스 번호 미리 얻어내기
		int seq = commentDao.getSequence();
		// 저장할 댓글의 정보를 dto 에 담기
		ReserveCommentDto dto = new ReserveCommentDto();
		dto.setNum(seq);
		dto.setWriter(writer);
		dto.setTarget_id(target_id);
		dto.setContent(content);
		dto.setRef_group(ref_group);
		// 원글의 댓글인경우
		if (comment_group == null) { // 원글에 댓글을 달면
			// 댓글의 글번호를 comment_group 번호로 사용한다.
			dto.setComment_group(seq);
		} else { // 댓글의 대댓글을 달면
			// 전송된 comment_group 번호를 숫자로 바꾸서 dto 에 넣어준다.
			dto.setComment_group(Integer.parseInt(comment_group));
		}
		// 댓글 정보를 DB 에 저장하기
		commentDao.insert(dto);
		// 응답하기 (원글 자세히 보기로 다시 리다일렉트 시킨다)
		String cPath = request.getContextPath();
	}

	
	//댓글 삭제
	@Override
	public Map<String, Object> deleteComment(HttpServletRequest request) {
		// 삭제할 댓글 번호를 읽어온다.
		int num = Integer.parseInt(request.getParameter("num"));
		ReserveCommentDto dto = commentDao.getData(num);
		String id = (String) request.getSession().getAttribute("id");
		/*
		if (!dto.getWriter().equals("id")) {
			throw new NotDeleteException("남의 파일 지우지 않기~");
		}
		*/
		// DB 에서 삭제한다.
		commentDao.delete(num);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isSuccess", true);
		
		return map;
	}

	
	//댓글 수정
	@Override
	public Map<String, Object> updateComment(ReserveCommentDto dto) {

		commentDao.update(dto);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isSuccess", true);
		
		return map;

	}
	
	
	//예약 확인
	@Override
	public List<ShelterDto> getCheckedList() {
		
		return dao.getCheckedList();
	}
	
	
	//예약 확정
	@Override
	public Map<String, Object> getCheckedY(HttpServletRequest request) {
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		dao.getCheckedY(num);
		
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		
		return map;
	}
	
	
	//예약 취소
	@Override
	public Map<String, Object> getCheckedN(HttpServletRequest request) {
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		dao.getCheckedN(num);
		
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		
		return map;
	}
	
	
	@Override
	public List<ReserveCommentDto> getAllCount() {
		
		return commentDao.getAllCount();
	}
	
	
	@Override
	public Map<String, Object> detailCheck(int num, String pwd) {
		
		ReserveDto dto2=dao.getDetailPwd(num);
		
		Map<String, Object> map=new HashMap<>();
		
		if(pwd.equals(dto2.getPwd())) {
			map.put("isSuccess", true);
		}else {
			map.put("isSuccess", false);
		}
		
		return map;
	}
	

}
package com.pet.spring.review.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pet.spring.review.dao.ReviewCommentDao;
import com.pet.spring.review.dao.ReviewDao;
import com.pet.spring.review.dto.ReviewCommentDto;
import com.pet.spring.review.dto.ReviewDto;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired private ReviewDao reviewDao;
	@Autowired private ReviewCommentDao reviewCommentDao;

	@Override
	public void getList(HttpServletRequest request) {
		//한 페이지에 몇개씩 표시할 것인지
	    final int PAGE_ROW_COUNT=3;
	    //하단 페이지를 몇개씩 표시할 것인지
	    final int PAGE_DISPLAY_COUNT=5;
	      
	    //보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	    int pageNum=1;
	    //페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	    String strPageNum=request.getParameter("pageNum");
	    //만일 페이지 번호가 파라미터로 넘어 온다면
	    if(strPageNum != null){
	       //숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
	       pageNum=Integer.parseInt(strPageNum);
	    }
	      
	    //보여줄 페이지의 시작 ROWNUM
	    int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	    //보여줄 페이지의 끝 ROWNUM
	    int endRowNum=pageNum*PAGE_ROW_COUNT;
	    
	    ////ReviewDto 객체에 startRowNum 과 endRowNum 을 담는다.
	    ReviewDto dto=new ReviewDto();
	    dto.setStartRowNum(startRowNum);
	    dto.setEndRowNum(endRowNum);
	    
	    //글 목록 얻어오기
	    List<ReviewDto> list=reviewDao.getList(dto);
	    
	    //전체글의 갯수
	    int totalRow=reviewDao.getCount(dto);
	    
	    //하단 시작 페이지 번호 
	    int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	    //하단 끝 페이지 번호
	    int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	      
	    //전체 페이지의 갯수
	    int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	    //끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이므로,
	    if(endPageNum > totalPageCount){
	       endPageNum=totalPageCount; //보정해 준다.
	    }
	    
	    //view page 에서 필요한 값을 request 에 담아준다.
	    request.setAttribute("pageNum", pageNum);
	    request.setAttribute("startPageNum", startPageNum);
	    request.setAttribute("endPageNum", endPageNum);
	    request.setAttribute("totalRow", totalRow);
	    request.setAttribute("totalPageCount", totalPageCount);
	    request.setAttribute("list", list);		
	}

	@Override
	public void getDetail(HttpServletRequest request) {
		//자세히 보여줄 글번호를 읽어온다. 
		int num=Integer.parseInt(request.getParameter("num"));
		//조회수 올리기
		reviewDao.addViewCount(num);
		
		//ReviewDto 객체를 생성한 후
		ReviewDto dto=new ReviewDto();
		//자세히 보여줄 글 번호를 넣어준다.
		dto.setNum(num);
		
		//ReviewDto 객체를 메소드의 인자로 전달해서 새로운 ReviewDto 객체의 참조값을 얻어온다.
		dto=reviewDao.getData(dto);
				
		// [댓글 페이징처리 로직]
		
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=10;
	   
		//detail.jsp 페이지에서는 항상 1페이지의 댓글 내용만 출력한다. 
		int pageNum=1;
	   
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//원글의 글번호를 이용해서 해당글에 달린 댓글 목록을 얻어온다.
		ReviewCommentDto commentDto=new ReviewCommentDto();
		commentDto.setRef_group(num);
		//1페이지에 해당하는 startRowNum 과 endRowNum 을 dto 에 담아서  
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);
		//1페이지에 해당하는 댓글 목록만 select 되도록 한다.
		List<ReviewCommentDto> commentList=reviewCommentDao.getList(commentDto);
		
		//원글의 글번호를 이용해서 댓글 전체의 갯수를 얻어낸다.
		int totalRow=reviewCommentDao.getCount(num);
		//댓글 전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		//view page 에서 필요한 값 request 에 담아주기
		request.setAttribute("dto", dto);
		request.setAttribute("commentList", commentList);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("totalPageCount", totalPageCount);		
	}

	@Override
	public void getData(HttpServletRequest request) {
		//수정할 글 번호
		int num=Integer.parseInt(request.getParameter("num"));
		//수정할 글의 정보를 얻어와서
		ReviewDto dto=reviewDao.getData(num);
		//request에 담아준다.
		request.setAttribute("dto", dto);
	}

	@Override
	public void saveContent(ReviewDto dto, HttpServletRequest request) {
		//업로드된 파일의 정보를 가지고 있는 MultipartFile 객체의 참조값을 얻어오기
		MultipartFile image = dto.getImgFile();
		//원본 파일명
		String orgFileName = image.getOriginalFilename();
		
		// webapp/upload 폴더 까지의 실제 경로(서버의 파일 시스템 상에서의 경로)
		String realPath = request.getServletContext().getRealPath("/upload");
		//db 에 저장할 저장할 파일의 상세 경로
		String filePath = realPath + File.separator;
		//디렉토리를 만들 파일 객체 생성
		File upload = new File(filePath);
		if(!upload.exists()) {
			//만약 디렉토리가 존재하지X
			upload.mkdir();//폴더 생성
		}
		//저장할 파일의 이름
		String saveFileName = System.currentTimeMillis() + orgFileName;
		
		try {
			//upload 폴더에 파일을 저장한다.
			image.transferTo(new File(filePath + saveFileName));
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		dto.setImg("/upload/" + saveFileName);
		
		reviewDao.insert(dto);
	}

	@Override
	public void updateContent(ReviewDto dto) {
		reviewDao.update(dto);
	}

	@Override
	public void deleteContent(int num, HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		String writer=reviewDao.getData(num).getWriter();
		if(id.equals(writer)) {
			reviewDao.delete(num);
		}
	}

	@Override
	public void saveComment(HttpServletRequest request) {
		//폼 전송되는 파라미터 추출
		int ref_group=Integer.parseInt(request.getParameter("ref_group"));
		String target_nick=request.getParameter("target_nick");
		String content=request.getParameter("content");
		
		String comment_group=request.getParameter("comment_group");
		
		//댓글 작성자는 session 영역에서 얻어내기
		String writer=(String)request.getSession().getAttribute("id");
		//댓글의 시퀀스 번호 미리 얻어내기
		int seq=reviewCommentDao.getSequence();
		
		//저장할 댓글의 정보를 dto에 담기
		ReviewCommentDto dto=new ReviewCommentDto();
		dto.setNum(seq);
		dto.setId(writer);
		dto.setTarget_nick(target_nick);
		dto.setContent(content);
		dto.setRef_group(ref_group);
		
		//원글의 댓글인 경우
		if(comment_group == null) {
			//댓글의 글번호를 comment_group 번호로 사용한다.
			dto.setComment_group(seq);
		}else {
			//전송된 comment_group 번호를 숫자로 바꿔서 dto 에 넣어준다.
			dto.setComment_group(Integer.parseInt(comment_group));
		}
		
		//댓글정보를 DB에 저장하기
		reviewCommentDao.insert(dto);
		
	}

	@Override
	public void updateComment(ReviewCommentDto dto) {
		reviewCommentDao.update(dto);
		
	}

	@Override
	public void deleteComment(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		reviewCommentDao.delete(num);
		
	}

	@Override
	public void moreCommentList(HttpServletRequest request) {
		//로그인된 아이디
		String id=(String)request.getSession().getAttribute("id");
		//ajax 요청 파라미터로 넘어오는 댓글의 페이지 번호를 읽어낸다
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		//ajax 요청 파라미터로 넘어오는 원글의 글 번호를 읽어낸다
		int num=Integer.parseInt(request.getParameter("num"));
		
		// [댓글 페이징처리 로직]
		
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=10;
	   	   
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//원글의 글번호를 이용해서 해당글에 달린 댓글 목록을 얻어온다.
		ReviewCommentDto commentDto=new ReviewCommentDto();
		commentDto.setRef_group(num);
		//1페이지에 해당하는 startRowNum 과 endRowNum 을 dto 에 담아서  
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);
		//1페이지에 해당하는 댓글 목록만 select 되도록 한다.
		List<ReviewCommentDto> commentList=reviewCommentDao.getList(commentDto);
		
		//원글의 글번호를 이용해서 댓글 전체의 갯수를 얻어낸다.
		int totalRow=reviewCommentDao.getCount(num);
		//댓글 전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		//view page 에서 필요한 값 request 에 담아주기
		request.setAttribute("pageNum", pageNum); //댓글의 페이지번호
		request.setAttribute("num", num); //원글의 글번호
		request.setAttribute("commentList", commentList);			
	}

}

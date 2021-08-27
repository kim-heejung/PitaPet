package com.pet.spring.adopt.service;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.spring.adopt.dao.AdoptDao;
import com.pet.spring.adopt.dto.AdoptDto;

@Service
public class AdoptServiceImpl implements AdoptService {

	@Autowired
	private AdoptDao dao;

	// 테스트용
	@Override
	public void testGetList(HttpServletRequest request) {

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
		
		String shelterName = request.getParameter("shelterName");
		if (shelterName == null) {
			// 조건에 빈 문자열을 넣어준다
			// 클라이언트 웹브라우저에 출력할때 "null"을 출력되지 않게 하기 위해서
			shelterName = "";
		}
		
		// 특수기호를 인코딩한 키워드를 미리 준비한다
		//String encodedK = URLEncoder.encode(shelterName);
		//String id=(String)request.getSession().getAttribute("id");
		
		// startRowNum 과 endRowNum 을 GalleryDto 객체에 담고
		AdoptDto dto = new AdoptDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		// 만일 검색 키워드가 넘어온다면
		if (!shelterName.equals("")) {
			if(!shelterName.equals("선택하기")) {
				dto.setName(shelterName);
			}else {
				shelterName="";
			}
		}

		// GalleryDao 객체를 이용해서 회원 목록을 얻어온다.
		List<AdoptDto> list = dao.getList(dto);

		// 하단 시작 페이지 번호
		int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		// 하단 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;

		// 전체 row 의 갯수
		int totalRow = dao.getCount(dto);
		// 전체 페이지의 갯수 구하기
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
		// 끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
		if (endPageNum > totalPageCount) {
			endPageNum = totalPageCount; // 보정해 준다.
		}
		
		// request 영역에 담아주기
		request.setAttribute("list", list); // gallery list
		request.setAttribute("startPageNum", startPageNum); // 시작 페이지 번호
		request.setAttribute("endPageNum", endPageNum); // 끝 페이지 번호
		request.setAttribute("pageNum", pageNum); // 현재 페이지 번호
		request.setAttribute("totalPageCount", totalPageCount); // 모든 페이지 count
		request.setAttribute("shelterName", shelterName);
		request.setAttribute("name", shelterName);
	}
	
	@Override
	public List<AdoptDto> getList(HttpServletRequest request) {

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
		
		String shelterName = request.getParameter("shelterName");		// 만일 키워드가 넘어오지 않는다면
		if (shelterName == null) {
			// 조건에 빈 문자열을 넣어준다
			// 클라이언트 웹브라우저에 출력할때 "null"을 출력되지 않게 하기 위해서
			shelterName = "";
		}
		
		// startRowNum 과 endRowNum 을 GalleryDto 객체에 담고
		AdoptDto dto = new AdoptDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		// 만일 검색 키워드가 넘어온다면
		if (!shelterName.equals("")) {
			if(!shelterName.equals("선택하기")) {
				dto.setName(shelterName);
			}
		}

		// 하단 시작 페이지 번호
		int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		// 하단 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
		
		// 전체 row 의 갯수
		int totalRow = dao.getCount(dto);
		// 전체 페이지의 갯수 구하기
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
		// 끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
		if (endPageNum > totalPageCount) {
			endPageNum = totalPageCount; // 보정해 준다.
		}

		// GalleryDao 객체를 이용해서 회원 목록을 얻어온다.
		List<AdoptDto> list = dao.getList(dto);

		return list;
	}
	
	/*
	@Override
	public void getDetail(ModelAndView mView, int num) {
		//dao 로 해당 게시글 num 에 해당하는 데이터(dto)를 가져온다.
		AdoptDto dto=new AdoptDto();
		dto.setNum(num);
		AdoptDto dto2 = dao.getData(dto);
		// ModelAndView 에 가져온 GalleryDto 를 담는다.
		mView.addObject("dto", dto2);
		// ModelAndView 에 담아주면 requestScope 영역에 담기는 것임.
	}*/
	
	
	@Override
	public AdoptDto getDetail(HttpServletRequest request) {
		//dao 로 해당 게시글 num 에 해당하는 데이터(dto)를 가져온다.
		
		int num=Integer.parseInt(request.getParameter("num"));
		String shelterName = request.getParameter("shelterName");
		
		AdoptDto dto=new AdoptDto();
		dto.setNum(num);
		
		// 만일 검색 키워드가 넘어온다면
		if (!shelterName.equals("")) {
			if(!shelterName.equals("선택하기")) {
				dto.setName(shelterName);
			}else {
				shelterName="";
			}
		}
		
		AdoptDto dto2 = dao.getData(dto);
		
		request.setAttribute("name", shelterName);
		
		return dto2;
	}


	
	@Override
	public Map<String, Object> insert(AdoptDto dto, HttpServletRequest request) {
		
		// 업로드된 파일의 정보를 가지고 있는 MultipartFile 객체의 참조값을 얻어오기
		MultipartFile image = dto.getImage();
		// 원본 파일명 -> 저장할 파일 이름 만들기위해서 사용됨
		String orgFileName = image.getOriginalFilename();
		// 파일 크기 -> 다운로드가 없으므로, 여기서는 필요 없다.
		long fileSize = image.getSize();

		// webapp/upload 폴더 까지의 실제 경로(서버의 파일 시스템 상에서의 경로)
		String realPath = request.getServletContext().getRealPath("/upload");
		// db 에 저장할 저장할 파일의 상세 경로
		String filePath = realPath + File.separator;
		// 디렉토리를 만들 파일 객체 생성
		File upload = new File(filePath);
		if (!upload.exists()) {
			// 만약 디렉토리가 존재하지X
			upload.mkdir();// 폴더 생성
		}
		// 저장할 파일의 이름을 구성한다. -> 우리가 직접 구성해줘야한다.
		String saveFileName = System.currentTimeMillis() + orgFileName;

		try {
			// upload 폴더에 파일을 저장한다.
			image.transferTo(new File(filePath + saveFileName));
			System.out.println(); // 임시 출력
		} catch (Exception e) {
			e.printStackTrace();
		}

		// dto 에 업로드된 파일의 정보를 담는다.
		// -> parameer 로 넘어온 dto 에는 caption, image 가 들어 있었다.
		// -> 추가할 것 : writer(id), imagePath 만 추가로 담아주면 된다.
		// -> num, regdate : db 에 추가하면서 자동으로 들어감
		String id = (String) request.getSession().getAttribute("id");
		dto.setWriter(id);
		// gallery 는 사진 다운 기능이 없다. -> orgFileName, saveFileName, fileSize 저장할 필요X
		// imagePath 만 저장해주면 됨
		dto.setImagePath("/upload/" + saveFileName);

		// GalleryDao 를 이용해서 DB 에 저장하기
		dao.insert(dto);

		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		
		return map;
				
	}


	
	@Override
	public Map<String, Object> update(AdoptDto dto, HttpServletRequest request) {

		
		// 업로드된 파일의 정보를 가지고 있는 MultipartFile 객체의 참조값을 얻어오기
		MultipartFile image = dto.getImage();
		// 원본 파일명 -> 저장할 파일 이름 만들기위해서 사용됨
		String orgFileName = image.getOriginalFilename();
		// 파일 크기 -> 다운로드가 없으므로, 여기서는 필요 없다.
		long fileSize = image.getSize();

		// webapp/upload 폴더 까지의 실제 경로(서버의 파일 시스템 상에서의 경로)
		String realPath = request.getServletContext().getRealPath("/upload");
		// db 에 저장할 저장할 파일의 상세 경로
		String filePath = realPath + File.separator;
		// 디렉토리를 만들 파일 객체 생성
		File upload = new File(filePath);
		if (!upload.exists()) {
			// 만약 디렉토리가 존재하지X
			upload.mkdir();// 폴더 생성
		}
		// 저장할 파일의 이름을 구성한다. -> 우리가 직접 구성해줘야한다.
		String saveFileName = System.currentTimeMillis() + orgFileName;

		try {
			// upload 폴더에 파일을 저장한다.
			image.transferTo(new File(filePath + saveFileName));
			System.out.println(); // 임시 출력
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		dto.setImagePath("/upload/" + saveFileName);
		dao.update(dto);
		
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		
		return map;

	}
	
		
	@Override
	public Map<String, Object> delete(int num, HttpServletRequest request) {
		// 세션에서 로그인된 아이디를 읽어와서
	      //String id=(String)request.getSession().getAttribute("id");
	      // 삭제할 글의 작성자
	      //String writer=dao.getData(num).getId();
	      // 만일 글의 작성자가 로그인된 아이디와 다르면*/
	      
		/*
	      if(! writer.equals(id)) {
	         // spring 에서는 service 에서 직접 응답해버리면 로직이 꼬이기 때문에
	         // 예외를 발생시켜서 응답을 예외 Controller 에서 하도록 한다.
	         throw new NotDeleteException("남의 파일 지우기 없기!");
	         // runtimeexception 을 상속 받았기 때문에 try, catch 문으로 묶지 않아도 됨.
	      }*/
		
	   
	      dao.delete(num); 
	      
	      Map<String, Object> map=new HashMap<>();
			map.put("isSuccess", true);
			
		return map;
	}
	
	
}

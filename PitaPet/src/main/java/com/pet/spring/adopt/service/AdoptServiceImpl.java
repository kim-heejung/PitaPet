package com.pet.spring.adopt.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pet.spring.adopt.dao.AdoptDao;
import com.pet.spring.adopt.dto.AdoptDto;

@Service
public class AdoptServiceImpl implements AdoptService {

	@Autowired
	private AdoptDao dao;
	
	
	@Override
	public List<AdoptDto> getList(HttpServletRequest request) {
		
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

		//보여줄 페이지의 시작 ROWNUM
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum = pageNum * PAGE_ROW_COUNT;
		
		String animalType = request.getParameter("animalType");
		
		if (animalType == null) {
			animalType = "";
		}
		
		AdoptDto dto = new AdoptDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
	    
		if(!animalType.equals("")) {
			dto.setAnimalType(animalType);
		}

		List<AdoptDto> list = dao.getList(dto);

		return list;
	}
	//테스트용-후에 삭제될 부분
	@Override
	public void testGetList(HttpServletRequest request) {
		
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

		//보여줄 페이지의 시작 ROWNUM
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum = pageNum * PAGE_ROW_COUNT;
		
		String animalType = request.getParameter("animalType");
		
		if (animalType == null) {
			animalType = "";
		}
		
		AdoptDto dto = new AdoptDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
	    
		if(!animalType.equals("")) {
			dto.setAnimalType(animalType);
		}

		//하단 시작 페이지 번호
		int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;

		//전체 row 의 갯수
		int totalRow = dao.getCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
		//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
		if (endPageNum > totalPageCount) {
			endPageNum = totalPageCount; //보정해 준다.
		}

		List<AdoptDto> list = dao.getList(dto);
		// request 영역에 담아주기
		request.setAttribute("list", list);
		request.setAttribute("startPageNum", startPageNum); // 시작 페이지 번호
		request.setAttribute("endPageNum", endPageNum); // 끝 페이지 번호
		request.setAttribute("pageNum", pageNum); // 현재 페이지 번호
		request.setAttribute("totalPageCount", totalPageCount); // 모든 페이지 count
		request.setAttribute("animalType", animalType);

	}
	
	@Override
	public Map<String, Object> getListPaging(HttpServletRequest request) {
		
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		String animalType=(String)request.getParameter("animalType");
		
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT = 8;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT = 5;

		//하단 시작 페이지 번호
		int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
		
		if (animalType == null) {
			animalType = "";
		}
		
		AdoptDto dto = new AdoptDto();
	    
		if(!animalType.equals("")) {
			dto.setAnimalType(animalType);
		}
		
		//전체 row 의 갯수
		int totalRow = dao.getCount(dto);
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
	public Map<String, Object> addViewCount(int num) {
		
		dao.addViewCount(num);
		
		Map<String, Object> map = new HashMap<>();
		map.put("isSuccess", true);
		
		return map;
	}
	
	@Override
	public AdoptDto getDetail(HttpServletRequest request) {
		
		int num=Integer.parseInt(request.getParameter("num"));
		String animalType = request.getParameter("animalType");
		
		if (animalType == null) {
			animalType = "";
		}
		
		AdoptDto dto=new AdoptDto();
		dto.setNum(num);
		
		if(!animalType.equals("")) {
			dto.setAnimalType(animalType);
		}
		
		AdoptDto dto2 = dao.getData(dto);
		
		return dto2;
	}
	//테스트용
	@Override
	public AdoptDto testGetDetail(HttpServletRequest request) {
		
		int num=Integer.parseInt(request.getParameter("num"));
		String animalType = request.getParameter("animalType");
		
		if (animalType == null) {
			animalType = "";
		}
		
		AdoptDto dto=new AdoptDto();
		dto.setNum(num);
		
		if(!animalType.equals("")) {
			dto.setAnimalType(animalType);
		}
		
		AdoptDto dto2 = dao.getData(dto);
		
		request.setAttribute("animalType", animalType);
		
		return dto2;
	}
	
	
	@Override
	public AdoptDto updateDetail(HttpServletRequest request) {
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		AdoptDto dto=new AdoptDto();
		dto.setNum(num);
		
		AdoptDto data = dao.getData(dto);
		
		request.setAttribute("dto", data);
		
		return data;
	}
	
	@Override
	public void insert(AdoptDto dto, HttpServletRequest request) {
		
		//업로드된 파일의 정보를 가지고 있는 MultipartFile 객체의 참조값을 얻어오기
		MultipartFile image = dto.getImage();
		//원본 파일명 -> 저장할 파일 이름 만들기위해서 사용됨
		String orgImageName = image.getOriginalFilename();
		//파일 크기 -> 다운로드가 없으므로, 여기서는 필요 없다.

		//webapp/upload 폴더 까지의 실제 경로(서버의 파일 시스템 상에서의 경로)
		String realPath = request.getServletContext().getRealPath("/upload");
		//db 에 저장할 저장할 파일의 상세 경로
		String filePath = realPath + File.separator;
		//디렉토리를 만들 파일 객체 생성
		File upload = new File(filePath);
		if (!upload.exists()) {
			//만약 디렉토리가 존재하지X
			upload.mkdir();// 폴더 생성
		}
		
		//저장할 파일의 이름을 구성한다. -> 우리가 직접 구성해줘야한다.
		String saveFileName = System.currentTimeMillis() + orgImageName;

		try {
			//upload 폴더에 파일을 저장한다.
			image.transferTo(new File(filePath + saveFileName));
			System.out.println(); // 임시 출력
		} catch (Exception e) {
			e.printStackTrace();
		}

		String id = (String) request.getSession().getAttribute("id");
		dto.setWriter(id);
		
		// imagePath 만 저장해주면 됨
		dto.setImagePath("/upload/" + saveFileName);
		dto.setOrgImageName(orgImageName);

		dao.insert(dto);
	
	}
	
	
	@Override
	public void update(AdoptDto dto, HttpServletRequest request) {
		
		//String newImage=dto.getImage().getOriginalFilename();
		
		//업로드된 파일의 정보를 가지고 있는 MultipartFile 객체의 참조값을 얻어오기
		MultipartFile image = dto.getImage();
		//원본 파일명 -> 저장할 파일 이름 만들기위해서 사용됨
		String orgImageName = image.getOriginalFilename();
		//파일 크기 -> 다운로드가 없으므로, 여기서는 필요 없다.

		//webapp/upload 폴더 까지의 실제 경로(서버의 파일 시스템 상에서의 경로)
		String realPath = request.getServletContext().getRealPath("/upload");
		//db 에 저장할 저장할 파일의 상세 경로
		String filePath = realPath + File.separator;
		//디렉토리를 만들 파일 객체 생성
		File upload = new File(filePath);
		if (!upload.exists()) {
			//만약 디렉토리가 존재하지X
			upload.mkdir();// 폴더 생성
		}
		//저장할 파일의 이름을 구성한다. -> 우리가 직접 구성해줘야한다.
		String saveFileName = System.currentTimeMillis() + orgImageName;

		try {
			//upload 폴더에 파일을 저장한다.
			image.transferTo(new File(filePath + saveFileName));
			System.out.println(); // 임시 출력
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		dto.setImagePath("/upload/" + saveFileName);
		dto.setOrgImageName(orgImageName);
		/*
		if(newImage != null) {
			
		}else {	
			
		}
		*/
		dao.update(dto);
		
	}
	
	
	@Override
	public void delete(int num) {
		
		dao.delete(num);

	}
	
	
	//생일 메인 노출
	@Override
	public AdoptDto mainBirthData() {

		return dao.mainBirthData();
	}
	
	@Override
	public List<AdoptDto> mainBirthList() {
		
		return dao.mainBirthList();
	}


}

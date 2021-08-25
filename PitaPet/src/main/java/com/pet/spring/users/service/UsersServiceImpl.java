package com.pet.spring.users.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.spring.shelter.dao.ShelterDao;
import com.pet.spring.shelter.dto.ShelterDto;
import com.pet.spring.users.dao.UsersDao;
import com.pet.spring.users.dto.UsersDto;


@Service
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	private UsersDao dao;
	
	@Autowired
	private ShelterDao sDao;

	@Override
	public Map<String, Object> isExistId(String inputId) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isExist",dao.isExist(inputId));
		return map;
	}
	
	@Transactional
	@Override
	public void addUser(UsersDto dto,ShelterDto sDto) {
		
		String pwd=dto.getPwd();
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(pwd);
		dto.setPwd(encodedPwd);
		
		dao.insert(dto);
		if(dto.getGroupNum()==1) {
			sDao.insert(sDto);
		}
	}

	@Override
	public void loginProcess(UsersDto dto, HttpSession session) {
		boolean isValid=false;
		
		UsersDto result=dao.getData(dto.getId());
		if(result !=null) {
			String encodedPwd=result.getPwd(); 
			String inputPwd=dto.getPwd(); 
			
			isValid=BCrypt.checkpw(inputPwd,encodedPwd);
		}
		if(isValid) {
			session.setAttribute("id", result.getId());
		}
		
	}

	@Override
	public void getInfo(HttpSession session, ModelAndView mView) {
		String id=(String)session.getAttribute("id");
		UsersDto dto=dao.getData(id);
		mView.addObject("dto",dto);
		if(dto.getGroupNum()==1) {
			mView.addObject("sDto", sDao.getData(id));
		}
	}

	@Override
	public void updateUserpwd(ModelAndView mView, HttpSession session, String pwd, String newPwd) {
		String id=(String)session.getAttribute("id");
		UsersDto dto=dao.getData(id);
		boolean isValid=BCrypt.checkpw(pwd,dto.getPwd());
		if(isValid) {
			BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
			String encodedPwd=encoder.encode(newPwd);
			dto.setPwd(encodedPwd);
			dao.updatePwd(dto);
			session.removeAttribute("id");
		}
		mView.addObject("isValid", isValid);
		mView.addObject("id", id);
		
	}

	@Override
	public Map<String, Object> saveProfileImage(HttpServletRequest request, MultipartFile mFile) {
		
		String orgFileName=mFile.getOriginalFilename();
		String saveFileName=System.currentTimeMillis()+orgFileName;
		String realPath=request.getServletContext().getRealPath("/upload");
		File upload=new File(realPath);
		if(!upload.exists()) {
		   upload.mkdir(); 
		}
		try {
		   String savePath=realPath+File.separator+saveFileName;
		   mFile.transferTo(new File(savePath));
		   System.out.println("savePath:"+savePath);
		}catch(Exception e) {
		   e.printStackTrace();
		}
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("imagePath", "/upload/"+saveFileName);
		   
		return map;
	}
	
	@Transactional
	@Override
	public void updateUser(HttpSession session, UsersDto dto,ShelterDto sDto) {
		String id=(String)session.getAttribute("id");
		dto.setId(id);
		dao.updateInfo(dto);
		if(dto.getGroupNum()==1) {
			sDao.updateInfo(sDto);
		}
	}

	@Override
	public void deleteUser(HttpSession session, ModelAndView mView) {
		String id=(String)session.getAttribute("id");
		dao.deleteUser(id);
		session.removeAttribute("id");
		mView.addObject("id", id);
	}
	
	
}

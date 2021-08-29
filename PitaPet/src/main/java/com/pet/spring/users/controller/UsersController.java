package com.pet.spring.users.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.pet.spring.shelter.dao.ShelterDao;
import com.pet.spring.shelter.dto.ShelterDto;
import com.pet.spring.shelter.service.ShelterService;
import com.pet.spring.users.dao.UsersDao;
import com.pet.spring.users.dto.UsersDto;
import com.pet.spring.users.service.UsersService;



@Controller
public class UsersController {
	@Autowired
	private UsersService service;
	
	@Autowired
	private ShelterService service2;
	
	@Autowired
	private UsersDao dao;
	
	@Autowired
	private ShelterDao sDao;
	
	/* NaverLoginBO */ 
	private NaverLoginBO naverLoginBO; 
	private String apiResult = null; 
	@Autowired 
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) { 
		this.naverLoginBO = naverLoginBO;
	}
	
	//로그인 첫 화면 요청 메소드 
	@RequestMapping(value = "/users/loginform", method = { RequestMethod.GET, RequestMethod.POST }) 
	public String login(Model model, HttpSession session) { 
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */ 
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session); 
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************& 
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125 
		System.out.println("네이버:" + naverAuthUrl); 
		//네이버 
		model.addAttribute("Nurl", naverAuthUrl); 
		return "users/loginform"; 
	}
	

	//네이버 로그인 성공시 callback호출 메소드 
	@RequestMapping(value = "/users/callback", method = { RequestMethod.GET, RequestMethod.POST }) 
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException { 
		System.out.println("여기는 callback"); 
		OAuth2AccessToken oauthToken; 
		oauthToken = naverLoginBO.getAccessToken(session, code, state); 
		//1. 로그인 사용자 정보를 읽어온다. 
		apiResult = naverLoginBO.getUserProfile(oauthToken); 
		//String형식의 json데이터 
		/** apiResult json 구조 
		 	{"resultcode":"00",
		 	 "message":"success", 
		 	 "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}} 
		**/ 
		//2. String형식인 apiResult를 json형태로 바꿈 
		JSONParser parser = new JSONParser(); 
		Object obj = parser.parse(apiResult); 
		JSONObject jsonObj = (JSONObject) obj; 
		//3. 데이터 파싱 
		//Top레벨 단계 _response 파싱 
		JSONObject response_obj = (JSONObject)jsonObj.get("response"); 
		String id=(String)response_obj.get("email");
		id="na_"+id.split("@")[0];
		System.out.println(response_obj); 
		
		//4.파싱 아이디 세션으로 저장 
		session.setAttribute("id",id); 
		//세션 생성 
		model.addAttribute("result", apiResult); 
		
		Map<String, Object> map=service.isExistId(id);
		boolean isExist=(boolean)map.get("isExist");
		if(!isExist) {
			UsersDto dto=new UsersDto();
			dto.setId(id);
			dto.setName((String)response_obj.get("name"));
			dto.setEmail((String)response_obj.get("email"));
			dto.setPhoneNumber((String)response_obj.get("mobile"));
			dto.setBirth((String)response_obj.get("birthyear"));
			dto.setGroupNum(0);
			
			BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
			String encodedPwd=encoder.encode("12345");
			dto.setPwd(encodedPwd);
			
			service.addUser(dto, null);
		}
		
		return "users/naver_login"; 
	}
	



	
	@RequestMapping("/api/users/info")
	@ResponseBody
	public Map<String,Object> authInfo(HttpSession session, HttpServletRequest request) {
		Map<String,Object> map=new HashMap<>();
		String id=(String)session.getAttribute("id");
		
		map.put("UsersDto", dao.getData(id));
		map.put("ShelterDto", sDao.getData(id));
		
		return map;
	}
	
	@RequestMapping(value = "/api/users/signup",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> signup(UsersDto dto,ShelterDto sDto) {
		service.addUser(dto,sDto);

		Map<String,Object> map=new HashMap<>();
		map.put("isSuccess",true);
		   
		return map;
	}
	
	@RequestMapping("/users/signup_form")
	public String singupForm() {
		return "users/signup_form";
	}
	
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String,Object> checkid(@RequestParam String inputId){
		return service.isExistId(inputId);
	}
	
	
	@RequestMapping("users/checkSerialNum")
	@ResponseBody
	public Map<String,Object> checkSerialNum(@RequestParam String inputNum){
		return service2.isExistNum(inputNum);
	}
		
	@RequestMapping(value = "/users/signup",method=RequestMethod.POST)
	public ModelAndView signup(ModelAndView mView,UsersDto dto,ShelterDto sDto) {
		service.addUser(dto,sDto);
		
		mView.setViewName("users/signup");
		return mView;
	}
	//@RequestMapping("/users/loginform")
	//public String loginform() {
	//	return "users/loginform";
	//}
	
	@RequestMapping("/users/login")
	public ModelAndView login(ModelAndView mView, UsersDto dto, @RequestParam String url, HttpSession session) {

		service.loginProcess(dto, session);
		
		String encodedUrl=URLEncoder.encode(url);
		mView.addObject("url", url);
		mView.addObject("encodedUrl", encodedUrl);
		
		mView.setViewName("users/login");
		return mView;
	}
	
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		return "redirect:/";
	}
	
	@RequestMapping("/users/info")
	public ModelAndView authInfo(HttpSession session, ModelAndView mView,HttpServletRequest request) {
		service.getInfo(session, mView);
		mView.setViewName("users/info");
		return mView;
	}
	
	@RequestMapping("/users/pwd_updateform")
	public ModelAndView authPwdUpdateForm(ModelAndView mView,HttpServletRequest request) {
		mView.setViewName("users/pwd_updateform");
		return mView;
	}
	
	@RequestMapping(value="/users/update",method=RequestMethod.POST)
	public ModelAndView authUpdate(HttpSession session,ModelAndView mView,UsersDto dto,HttpServletRequest request,ShelterDto sDto) {
		service.updateUser(session, dto,sDto);
		mView.setViewName("redirect:/users/info.do");
		return mView;
	}
	
	@RequestMapping("/users/pwd_update")
	public ModelAndView authPwdUpdate(HttpServletRequest request,ModelAndView mView, HttpSession session, @RequestParam String pwd, @RequestParam String newPwd) {
		service.updateUserpwd(mView, session, pwd, newPwd);
		mView.setViewName("users/pwd_update");
		return mView;
	}
	
	@RequestMapping("/users/updateform")
	public ModelAndView authUpdateform(ModelAndView mView,HttpSession session,HttpServletRequest request) {
		service.getInfo(session, mView);
		mView.setViewName("users/updateform");
		return mView;
	}
	
	@RequestMapping("/users/delete")
	public ModelAndView authDelete(HttpSession session,ModelAndView mView,HttpServletRequest request) {
		service.deleteUser(session,mView);
		mView.setViewName("users/delete");
		return mView;
	}
}

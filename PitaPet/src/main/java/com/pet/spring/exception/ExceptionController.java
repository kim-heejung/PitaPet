package com.pet.spring.exception;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
//예외 컨트롤러를 bean으로 만들기 위한 어노테이션
import org.springframework.web.servlet.ModelAndView;
@ControllerAdvice
public class ExceptionController {
	
	
	//DB관련 작업을 하다가 발생하는 예외를 처리하는 컨트롤러
	@ExceptionHandler(DataAccessException.class)
	public ModelAndView dataAccess(DataAccessException dae) {
		ModelAndView mView=new ModelAndView();
		mView.addObject("exception", dae);
		mView.setViewName("error/info");
		return mView;
	}
	
}

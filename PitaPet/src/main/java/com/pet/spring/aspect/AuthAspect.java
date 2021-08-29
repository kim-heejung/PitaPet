package com.pet.spring.aspect;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
public class AuthAspect {
	
	  @Around("execution(org.springframework.web.servlet.ModelAndView auth*(..))")
	   public Object loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
	      Object[] args=joinPoint.getArgs();
	      for(Object tmp:args) {
	         if(tmp instanceof HttpServletRequest) {
	            HttpServletRequest request=(HttpServletRequest)tmp;
	            String id=(String)request.getSession().getAttribute("id");
	            if(id == null) {
	               String url=request.getRequestURI();
	               String query=request.getQueryString();
	               String encodedUrl=null;
	               if(query==null) {
	                  encodedUrl=URLEncoder.encode(url);
	               }else {
	                  encodedUrl=URLEncoder.encode(url+"?"+query);
	               }
	                  
	               ModelAndView mView=new ModelAndView();
	               mView.setViewName("redirect:/users/loginform.do?url="+encodedUrl);

	               return mView;
	            }
	         }
	      }
	      
	      Object obj=joinPoint.proceed();
	      
	      return obj;
	   }
	   
	   @Around("execution(java.util.Map auth*(..))")
	   public Object loginCheckAjax(ProceedingJoinPoint joinPoint) throws Throwable {
	      Object[] args=joinPoint.getArgs();
	      for(Object tmp:args) {
	         if(tmp instanceof HttpServletRequest) {
	            HttpServletRequest request=(HttpServletRequest)tmp;
	            String id=(String)request.getSession().getAttribute("id");
	            if(id == null) {
	               throw new RuntimeException("로그인이 필요 합니다.");
	            }
	         }
	      }
	      
	      Object obj=joinPoint.proceed();
	      
	      return obj;
	   }
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header id="header">
     <div class="top">
         <div class="container" style="display:flex; align-items:center; justify-content:flex-end;">
         	<c:choose>
				<c:when test="${empty sessionScope.id }">
					<a href="${pageContext.request.contextPath}/users/loginform.do">로그인</a>
					<a href="${pageContext.request.contextPath}/users/signup_form.do">회원가입</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/users/info.do">${sessionScope.id }</a> 로그인 중..
					<a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
				</c:otherwise>
			</c:choose>
         </div>
     </div>
     <nav class="nav-bar container">
         <a href="${pageContext.request.contextPath}" class="logo">
             <img src="${pageContext.request.contextPath}/resources/images/logo.png">
             <span>Pit a Pet</span>
         </a>
         <ul class="menu-wrap">
             <li class="menu-list"><a href="${pageContext.request.contextPath}/list.do">입양절차알아보기</a></li>
             <li class="menu-list"><a href="${pageContext.request.contextPath}/adopt/list.do">입양하기</a></li>
             <li class="menu-list"><a href="${pageContext.request.contextPath}/review/list.do">입양후기</a></li>
             <li class="menu-list"><a href="${pageContext.request.contextPath}/list.do">후원하기</a></li>
         </ul>
     </nav>
</header>
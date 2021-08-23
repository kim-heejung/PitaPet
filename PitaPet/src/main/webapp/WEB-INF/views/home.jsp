<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>/views/home.jsp</title>
</head>
<body>
<div class="container">
	<a href="${pageContext.request.contextPath}/users/loginform.do">로그인</a>
	<a href="${pageContext.request.contextPath}/users/signup_form.do">회원가입</a>
</div>
</body>
</html>

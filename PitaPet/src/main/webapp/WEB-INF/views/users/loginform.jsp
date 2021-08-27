<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
</head>
<body>
<div class="container">
	<h1>로그인 폼</h1>
	<form action="${pageContext.request.contextPath}/users/login.do" method="post">
		<c:choose>
			<c:when test="${ empty param.url2 }">
				<input type="hidden" name="url" value="${pageContext.request.contextPath}/"/>
			</c:when>
			<c:otherwise>
				<input type="hidden" name="url" value="${param.url }"/>
			</c:otherwise>
		</c:choose>
		<div>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id"/>
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<input type="password" name="pwd" id="pwd"/>
		</div>
		<button type="submit">로그인</button>
	</form>
	<!-- 네이버 로그인 창으로 이동 --> 
	<div id="naver_id_login" style="text-align:center">
		<a href="${Nurl}"> 
		<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
	</div> 
</div>
</body>
</html>
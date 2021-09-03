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
	<h3>비밀글 보기</h3>
	<p>
		이 글은 비밀글 입니다.
		<br /> 
		비밀번호를 입력해주세요
	</p>
	<form action="${pageContext.request.contextPath}/reserve/detailcheck.do?num=${num}" method="post">
		<div>
			<label for="pwd">비밀번호</label>
			<input type="password" name="pwd" id="pwd"/>
		</div>
		<button type="submit">확인</button>
	</form>
	<a href="">목록보기</a>
</div>
</body>
</html>
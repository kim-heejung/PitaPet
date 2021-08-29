<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/updateform.jsp</title>
</head>
<body>
<div class="container">
	<h1>글 수정 폼입니다.</h1>
	<form action="${pageContext.request.contextPath}/api/reserve/update.do" method="post">
		<input type="text" name="num" value="${dto.num}"/>
		<div>
			<label for="title">제목</label>
			<input type="text" name="title" id="title" value="${dto.title}"/>
		</div>
		<div>
			<label for="reservedTime">시간</label>
			<textarea name="reservedTime" id="reservedTime">${dto.reservedTime}</textarea>
		</div>
		<button type="submit">수정확인</button>
		<button type="reset">최소</button>
	</form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pit a pet</title>
</head>
<body>
<div class="container">
	<h1>새글 작성 폼</h1>
	<form action="${pageContext.request.contextPath}/api/reserve/insert.do" method="post">
	      	<!-- 입양하기 dtail 옆에 넣을거면 번호, 보호소지역이름 넣어 줘야함. -->
	      	<input type="hidden" name="num" id="num" value="${num}"/>
	      	<div>
	         	<label for="title">제목</label>
	         	<input type="text" name="title" id="title"/>
	      	</div>
	      	<div>
	         	<label for="reservedTime">예약시간</label>
	         	<input type="text" name="reservedTime" id="reservedTime"/>
	      	</div>
	      	<button type="reset">최소</button>
	      	<button type="submit">등록</button>
	</form>
</div>
</body>
</html>
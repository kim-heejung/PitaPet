<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
</head>
<body>
<div class="container">
	<h1>새글 작성</h1>
	<form action="${pageContext.request.contextPath}/api/reserve/insert.do" method="post">
	      	<div>
	         	<label for="title">제목</label>
	         	<input type="text" name="title" id="title"/>
	      	</div>
	      	<div>
	      		<label for="shelterName">지점</label>
	      		<select name="shelterName" id="shelterName">
		   			<option value="지점 선택">지점 선택</option>
		   			<option value="서울">서울</option>
		   			<option value="인천">인천</option>
		   			<option value="부산">부산</option>
				</select>
	      	</div>
	      	<div>
	      		<label for="reservedDate">날짜</label>
	      		<select name="reservedDate" id="reservedDate">
		   			<option value="날짜 선택">날짜 선택</option>
		   			<option value="9월 1일">9월 1일</option>
		   			<option value="9월 2일">9월 2일</option>
		   			<option value="9월 3일">9월 3일</option>
		   			<option value="9월 6일">9월 6일</option>
		   			<option value="9월 7일">9월 7일</option>
				</select>
	      	</div>
	      	<div>
	         	<label for="reservedTime">시간</label>
	         	<select name="reservedTime" id="reservedTime">
		   			<option value="시간 선택">시간 선택</option>
		   			<option value="10:00">10:00</option>
		   			<option value="11:00">11:00</option>
		   			<option value="13:00">13:00</option>
		   			<option value="14:00">14:00</option>
		   			<option value="15:00">15:00</option>
				</select>
	      	</div>
	      	<div>
	         	<label for="name">이름</label>
	         	<input type="text" name="name" id="name"/>
	      	</div>
	      	<div>
	         	<label for="phoneNumber">연락처</label>
	         	<input type="text" name="phoneNumber" id="phoneNumber"/>
	      	</div>
	      	<div>
	         	<label for="title">내용</label>
	         	<textarea name="content" id="" cols="30" rows="10"></textarea>
	      	</div>
	      	<button type="reset">최소</button>
	      	<button type="submit">등록</button>
	</form>
</div>
</body>
</html>
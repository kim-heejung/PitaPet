<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/pwd_updateform.jsp</title>
</head>
<body>
<div class="container">
	<h1>비밀 번호 수정 폼</h1>
	<form action="${pageContext.request.contextPath}/users/pwd_update.do" method="post" id="myForm">
		<div>
			<label for="pwd">기존 비밀 번호 </label>
			<input type="password" name="pwd"/>
		</div>
		<div>
			<label for="newPwd">새 비밀번호</label>
			<input type="password" name="newPwd" id="newPwd"/>
		</div>
		<div>
			<label for="newPwd2">새 비밀번호 확인</label>
			<input type="password" id="newPwd2"/>
		</div>
		<button type="submit">수정하기</button>
		<button type="reset">취소</button>
	</form>
</div>
<script>
	//폼에 submit 이벤트가 발생했을때 실행할 함수(비밀번호 일치 확인)

</script>
</body>
</html>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
</head>
<body>
<div id="login">
	<div class="container">
		<h1>알림</h1>
		<div v-if="${not empty sessionScope.id }">
			<p>
				<strong>${sessionScope.id }</strong>님 로그인 되었습니다.
				<a :href="host">확인</a>
			</p>
		</div>
		<div v-else>
			<p>
				아이디 혹은 비밀번호가 틀립니다
				<a href="loginform.do?url=${encodedUrl }">다시 시도</a>
			</p>
		</div>		
	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
let login = new Vue({
	el:"#login",
	data(){
		return{
			host:"http://localhost:8888/spring/"
		}
	}
});
</script>
</body>
</html>
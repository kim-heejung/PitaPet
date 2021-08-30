<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<style>
.idForm, .pwdForm{
	margin-bottom:10px;
}
</style>
</head>
<body>
<div id="loginform">
	<div class="container">
		<h1 v-bind:id="loginformId">로그인 폼</h1>
		<form action="${pageContext.request.contextPath}/users/login.do" method="post">
			<c:choose>
				<c:when test="${ empty param.url2 }">
					<input type="hidden" name="url" value="${pageContext.request.contextPath}/"/>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="url" value="${param.url }"/>
				</c:otherwise>
			</c:choose>
			<div class="idForm">
				<label for="id">아이디</label>
				<input type="text" name="id" id="id"/>
			</div>
			<div class="pwdForm">
				<label for="pwd">비밀번호</label>
				<input type="password" name="pwd" id="pwd"/>
			</div>
			<button class="btn btn-primary" v-on:click="login" type="submit">로그인</button>
		</form>
		<!-- 네이버 로그인 창으로 이동 --> 
		<a href="${Nurl}">
			<img width="223" src="${pageContext.request.contextPath}/resources/images/naver_login.png"/>
		</a>
	
		<!-- 카카오 로그인 창으로 이동 --> 
		 <a href="https://kauth.kakao.com/oauth/authorize?client_id=f925a85d9447bd400ba51c4ff5efdbd7&redirect_uri=http://localhost:8888/spring/users/kakao.do&response_type=code">
		 	<img src="${pageContext.request.contextPath}/resources/images/kakao_login_medium_narrow.png" alt="" />
		 </a>
	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
let loginform = new Vue({
	el:"#loginform",
	data(){
		return{
			loginformId:'로그인 폼',
		}
	},
	methods:{
	    login(){
	    	id:"id",
	    	pwd:"pwd"
	    }
});
</script>
</body>
</html>
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
	<div class="container card login" v-if="!registerActive" v-bind:class="{ error: emptyFields }">
		<h1>로그인 폼</h1>
		<form action="${pageContext.request.contextPath}/users/login.do" method="post">
				<div v-if="${ empty param.url2 }">
					<input type="hidden" name="url" value="${pageContext.request.contextPath}/"/>
				</div>
				<div v-else>
					<input type="hidden" name="url" value="${param.url }"/>
				</div>
			<div class="idForm">
				<label for="id">아이디</label>
				<input class="form-control" v-model="idLogin" type="text" name="id" id="id"/>
			</div>
			<div class="pwdForm">
				<label for="pwd">비밀번호</label>
				<input class="form-control" v-model="pwdLogin" type="password" name="pwd" id="pwd"/>
			</div>
			<button class="btn btn-primary" @click="doLogin" type="submit">로그인</button>
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
			idLogin: "",
		    pwdLogin: "",
		    emptyFields: false
		}
	},
	methods:{
		doLogin() {
	         if (this.emailLogin === "" || this.passwordLogin === "") {
	            this.emptyFields = true;
	         } else {
	            alert("You are now logged in");
	         }
	    }
});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<jsp:include page="/resources/resource.jsp"></jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<style>
body {
    margin: 0;
    padding: 0;
    display:flex; /* You delete it on your web page */
    justify-content:center;/* and this - delete */
}
a:hover,
a:focus {
    text-decoration: none;
    color: #eee;
}
.login-card {
    min-height: 100vh;
    background-image: url('${pageContext.request.contextPath}/resources/images/loginform.jpg');
    background-size: cover;
    background-position: center center;
    background-repeat: no-repeat;
    position: relative;
    border-radius: 5px;
    z-index: 2;
    padding: 0;
    align-items: center;
    justify-content: center;
}
.login-card:after {
    background: linear-gradient(-135deg, rgb(63, 81, 181), rgb(233, 30, 99));
    /* Login Card Arkaplan Rengi */
    
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    content: "";
    opacity: 0.8;
    z-index: -999;
}
.login-card > form {
    z-index: 4;
    position: relative;
    padding: 0px 25px;
    width: 100%;
}
.logo-kapsul {
    text-align: center;
    position: relative;
    opacity: 0.8;
}
.logo {
    height: auto;
    padding: 50px 0px;
}
/* form başlangıç stiller ------------------------------- */

.group {
    position: relative;
    margin-bottom: 45px;
}
.group input {
    font-size: 18px;
    padding: 10px 10px 10px 10px;
    display: block;
    width: 100%;
    border: none;
    border-bottom: 1px solid rgba(255, 255, 255, 0.3);
    background: none;
    color: #eee;
}
.group input:focus {
    outline: none;
}
/* LABEL ======================================= */

.group label {
    color: rgba(255, 255, 255, 0.5);
    font-size: 18px;
    font-weight: normal;
    position: absolute;
    pointer-events: none;
    left: 5px;
    top: 5px;
    transition: 0.2s ease all;
    -moz-transition: 0.2s ease all;
    -webkit-transition: 0.2s ease all;
}
/* active durum */

.group input:focus ~ label,
input:valid ~ label {
    top: -20px;
    font-size: 14px;
    color: rgba(255, 255, 255, 0.7);
}
/* BOTTOM BARS ================================= */

.bar {
    position: relative;
    display: block;
    width: 100%;
}
.bar:before,
.bar:after {
    content: '';
    height: 2px;
    width: 0;
    top:-5px;
    position: absolute;
    background: rgba(255, 255, 255, 0.7);
    transition: 0.2s ease all;
    -moz-transition: 0.2s ease all;
    -webkit-transition: 0.2s ease all;
}
.bar:before {
    left: 50%;
}
.bar:after {
    right: 50%;
}
/* active durum bar */

.group input:focus ~ .bar:before,
.group input:focus ~ .bar:after {
    width: 50%;
}
/* HIGHLIGHTER ================================== */

.highlight {
    position: absolute;
    height: 0%;
    width: 100px;
    top: 25%;
    left: 0;
    pointer-events: none;
    opacity: 0.5;
}
/* active durum */

.group input:focus ~ .highlight {
    -webkit-animation: inputHighlighter 0.3s ease;
    -moz-animation: inputHighlighter 0.3s ease;
    animation: inputHighlighter 0.3s ease;
}
/* form animasyon ================ */

@-webkit-keyframes inputHighlighter {
    from {
        background: rgba(255, 255, 255, 0.7);
    }
    to {
        width: 0;
        background: transparent;
    }
}
@-moz-keyframes inputHighlighter {
    from {
        background: rgba(255, 255, 255, 0.7);
    }
    to {
        width: 0;
        background: transparent;
    }
}
@keyframes inputHighlighter {
    from {
        background: rgba(255, 255, 255, 0.7);
    }
    to {
        width: 0;
        background: transparent;
    }
}
.input-ikon {
    font-size: 25px!important;
    position: relative;
}
.input-sifre-ikon {
    font-size: 22px!important;
    position: relative;
}
.span-input {
    position: relative;
    top: -5px;
}
.giris-yap-buton{
    background: linear-gradient(-135deg, rgb(63, 81, 181), rgb(233, 30, 99));
    background: -webkit-linear-gradient(-135deg, rgb(63, 81, 181), rgb(233, 30, 99));
    width: 625px;
    height: 48px;
    display: block;
    font-weight: 100;
    border-radius: 7px;
    opacity: 0.8;
    border:none;
    color:#fff;
}
.giris-yap-buton:hover {
	color:#000;
	 box-shadow: 0 10px 35px rgba(0, 0, 0, 0.05), 0 6px 6px rgba(0, 0, 0, 0.1);
}
.forgot-and-create {
    margin: 20px 0px;
    z-index: -999em;
    display:flex;
    justify-content: center;
}

/* Geçiş Links Forgot and Create */

.zaten-hesap-var-link {
    color: #bbb;
    font-size: 14px;
    padding: 20px 0px;
    text-decoration: none;
    display: block;
}
</style>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div id="loginform">
	<jsp:include page="/resources/header.jsp"></jsp:include>
	<slider-component :cpath="cpath"></slider-component>
	<intro-component></intro-component>
	<review-component></review-component>
	<family-component></family-component>
	<footer-component></footer-component>
	<div class="container login-card" v-if="!registerActive" v-bind:class="{ error: emptyFields }">
		<form id="login-form" action="${pageContext.request.contextPath}/users/login.do" method="post">
			
			<div class="logo-kapsul">
            	<img width="100" class="logo" src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Logo" />
        	</div>
        
			<div v-if="${ empty param.url }">
				<input type="hidden" name="url" value="${pageContext.request.contextPath}/"/>
			</div>
			<div v-else>
				<input type="hidden" name="url" value="${param.url }"/>
			</div>
			
			<div class="group">
				<div class="idForm">
					<input required class="span-input" v-model="idLogin" type="text" name="id" id="id"/>
					<span class="highlight"></span>
           			<span class="bar"></span>
					<label for="id"><i class="material-icons input-ikon"></i><span class="span-input">아이디를 입력하세요.</span></label>
				</div>
			</div>
   
   			<div class="group">
   				<div class="pwdForm">
		            <input required type="password" class="span-input" name="pwd" id="pwd" />
		            <span class="highlight"></span>
		            <span class="bar"></span>
		            <label for="pwd"><i class="material-icons input-sifre-ikon"></i><span class="span-input">비밀번호를 입력하세요.</span></label>
      			</div>
      		</div>
		
			<button class="giris-yap-buton" @click="doLogin" type="submit">로그인</button>
		</form>
		
		<div class="forgot-and-create">
			<!-- 네이버 로그인 창으로 이동 --> 
			<a href="${Nurl}">
				<img width="250" src="${pageContext.request.contextPath}/resources/images/naver_login.png" />
			</a>
		
			<!-- 카카오 로그인 창으로 이동 --> 
			 <a href="https://kauth.kakao.com/oauth/authorize?client_id=f925a85d9447bd400ba51c4ff5efdbd7&redirect_uri=http://localhost:8888/spring/users/kakao.do&response_type=code">
			 	<img width="250" src="${pageContext.request.contextPath}/resources/images/kakao_login.png" />
			 </a>
	 	</div>
	 
	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
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

$(document).ready(function(){

	//Kaydol - Şifre Unuttum Linkleri Arası Geçiş
	$(document).ready(function(){
	$("#kayit-form").hide();
	$("#sifre-hatirlat-form").hide();	
	$(".hesap-olustur-link").click(function(e){
	$("#login-form").slideUp(0);	
	$("#kayit-form").fadeIn(300);	
	});

	$(".zaten-hesap-var-link").click(function(e){
	$("#kayit-form").slideUp(0);
	$("#sifre-hatirlat-form").slideUp(0);	
	$("#login-form").fadeIn(300);	
	});

	$(".sifre-hatirlat-link").click(function(e){
	$("#login-form").slideUp(0);	
	$("#sifre-hatirlat-form").fadeIn(300);	
	});
	});

	});
</script>
</body>
</html>
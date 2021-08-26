<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;500;600;700&family=Nanum+Myeongjo:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
	<style>
		.container{
			width:1200px;
			margin:0 auto;
		}
	</style>
</head>
<body>
<div id="home">
	<div class="container" style="position:absolute; top:0; left:50%; transform:translateX(-50%);display:flex; align-items:center; justify-content:flex-end; height:44px;">
		<c:choose>
			<c:when test="${empty sessionScope.id }">
				<a href="${pageContext.request.contextPath}/users/loginform.do">로그인</a>
				<a href="${pageContext.request.contextPath}/users/signup_form.do">회원가입</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/users/info.do">${sessionScope.id }</a> 로그인 중..
				<a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
			</c:otherwise>
		</c:choose>
	</div>
	<header-component :cpath="cpath"></header-component>
	<slider-component :cpath="cpath"></slider-component>
	<div class="container">
		<intro-component></intro-component>
		<review-component></review-component>
		<family-component></family-component>
	</div>
	<footer-component></footer-component>
</div>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slider.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/intro.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/adopt_review.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/adopt_family.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script>
	new Vue({
		el:"#home",
		data(){
			return{
				cpath: "${pageContext.request.contextPath}",
			}
		}
	});
		

</script>
</body>
</html>

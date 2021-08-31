<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
	<jsp:include page="/resources/resource.jsp"></jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
</head>
<body>

<a href="${pageContext.request.contextPath}/review/list.do">입양후기 게시판</a>
<a href="${pageContext.request.contextPath}/shop/list.do">쇼핑하기 </a>


<a href="javascript:" onclick="userAccess()">후원하기 게시판</a>


<div id="home">
	<jsp:include page="/resources/header.jsp"></jsp:include>
	<slider-component :cpath="cpath"></slider-component>
	<intro-component></intro-component>
	<review-component></review-component>
	<family-component></family-component>
	<footer-component></footer-component>
</div>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slider.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/intro.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/adopt_review.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/adopt_family.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script>
	let home = new Vue({
		el:"#home",
		data:{
			cpath: "${pageContext.request.contextPath}",
		}
	});
</script>
 <script type="text/javascript">
	function userAccess(){
		if(${empty sessionScope.id }){
			alert("pit a pet(핏어펫) 회원만 접근할 수 있는 페이지 입니다.");
		}else{
			location.href="${pageContext.request.contextPath}/donation/main.do";
		}
	}
</script>
</body>
</html>

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
<div id="home">
	<header-component :cpath="cpath" :id="id"></header-component>
	<slider-component :cpath="cpath"></slider-component>
	<intro-component></intro-component>
	<review-component :cpath="cpath"></review-component>
	<family-component :cpath="cpath"></family-component>
	<footer-component></footer-component>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
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
			id: "${sessionScope.id}"
		},
	});
</script>
</body>
</html>


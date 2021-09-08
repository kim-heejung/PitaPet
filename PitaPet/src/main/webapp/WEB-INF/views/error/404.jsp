<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
	<jsp:include page="/resources/resource.jsp"></jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />
</head>
<body>
<div id="errorPage" >
	<header-component :cpath="cpath" :id="id"></header-component>
	<div class="board-wrap">
		<div class="container text-center mt-5">
	    	<h3>존재하지 않는 페이지입니다</h3>
			<a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/">인덱스로 가기</a>
	    </div>
    </div>
   <footer-component></footer-component>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
const base_url="http://localhost:8888/spring";
new Vue({
    el : "#errorPage",
    data:{
		cpath: "${pageContext.request.contextPath}",
		id: "${sessionScope.id}",
	   }
  });
</script>
</html>


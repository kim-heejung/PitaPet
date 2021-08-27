<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>/views/home.jsp</title>
</head>
<body>
<div class="container">

	<section>
		<div id="tabs">
			<button v-for="(tab, index) in tabs"
					v-bind:class="{active: currentTab == index}"
					v-on:click="currentTab = index">{{tab}}</button>
			<div class="tab-content">
				<div v-show="currentTab==0">tab content1</div>
				<div v-show="currentTab==1">tab content2</div>
			</div>
		</div>
		
	</section>

	<c:choose>
		<c:when test="${empty sessionScope.id}">
			<a href="${pageContext.request.contextPath}/users/loginform.do">로그인</a>
			<a href="${pageContext.request.contextPath}/users/signup_form.do">회원가입</a>
			
		</c:when>
		<c:otherwise>
			<p>
			<a href="${pageContext.request.contextPath}/users/info.do">${sessionScope.id }</a> 로그인 중..
			<a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
			</p>
		</c:otherwise>
	</c:choose>
  
	<a href="${pageContext.request.contextPath}/review/list.do">입양후기 게시판</a>

</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script>
	new Vue({
	    el: '#tabs',
	    data(){
	    	return{
	    		currentTab:0,
	    		tabs:["tab1", "tab2"]
	    	}
	    }
	});
</script>
</body>
</html>

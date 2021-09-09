<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<link href='https://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<jsp:include page="/resources/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<style>

</style>
</head>
<body>
<div id="login">
	<div class="container">
		<div class="alert alert-primary" role="alert" variant="success" v-if="${not empty sessionScope.id }">
			<p>
				<strong>${sessionScope.id }</strong>님 로그인 되었습니다.
				<a :href="host">확인</a>
			</p>
		</div>
		<div class="alert alert-danger" role="alert" variant="error" v-else> 
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
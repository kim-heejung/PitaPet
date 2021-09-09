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
</head>
<body>
<div id="pwd_update">
	<div class="container">	
			<div v-if="${isValid }" class="alert alert-primary" role="alert">
				<p>
					${id }님 비밀번호를 수정하고 로그아웃 되었습니다.
					<a :href="loginform">다시 로그인 하러 가기</a>
				</p>
			</div>
			<div v-else class="alert alert-danger" role="alert">
				이전 비밀번호가 일치하지 않습니다
				<a :href="pwd_updateform">다시 시도</a>
			</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
new Vue({
	el:"#pwd_update",
	data(){
		return{
			pwd_updateform:"${pageContext.request.contextPath}/users/pwd_updateform.do",
			loginform:"${pageContext.request.contextPath}/users/loginform.do"
		}
	}
});
</script>
</body>
</html>
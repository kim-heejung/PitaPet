<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
</head>
<body>
<div id="pwd_update">
	<div class="container">
		<c:choose>
			<c:when test="${isValid }">
			<p>
				${id }님 비밀번호를 수정하고 로그아웃 되었습니다.
				<a :href="loginform">다시 로그인 하러 가기</a>
			</p>
			</c:when>
			<c:otherwise>
				이전 비밀번호가 일치하지 않습니다
				<a :href="pwd_updateform">다시 시도</a>
			</c:otherwise>
		</c:choose>
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
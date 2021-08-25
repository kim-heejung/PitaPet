<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.jsp</title>
</head>
<body>
<div id="app">
	<a :href="loginFormLink">로그인 하러가기</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script>
	new Vue({
		el: "#app",
		data: {
			loginFormLink: "${pageContext.request.contextPath}/users/loginform.do"
		}
	});
</script>
</body>
</html>
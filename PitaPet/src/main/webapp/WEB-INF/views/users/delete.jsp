<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/users/delete.jsp</title>
</head>
<body>
<div id="delete">
	<div class="container">
		<h1>알림</h1>
		<p>
			<strong>${id }</strong>탈퇴 처리 되었습니다.
			<a :href="home">인덱스로 가기</a>
		</p>
	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	new Vue({
		el:"#delete",
		data(){
			return{
				home:"${pageContext.request.contextPath}/home.do"
			}
		}
	});

</script>
</body>
</html>
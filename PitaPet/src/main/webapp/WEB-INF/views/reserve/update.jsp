<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/update.jsp</title>
</head>
<body>
	<script>
		alert("${id} 님 글을 수정했습니다."); // session 영역에 있는 아이디를 사용.
		location.href = "${pageContext.request.contextPath}/adopt/detail.do?num=${param.num}";
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<jsp:include page="/resources/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<style>
	
</style>
</head>
<body>
	<c:choose>
		<c:when test="${isSuccess }">
			<script>
		        location.href="${pageContext.request.contextPath }/reserve/detail.do?num=${num}";
		    </script>
		</c:when>
		<c:otherwise>
			<script>
		    	alert("비밀번호가 틀립니다.");
		        location.href="${pageContext.request.contextPath }/reserve/detailcheckform.do?num=${num}";
		    </script>
		</c:otherwise>
	</c:choose>
</body>
</html>
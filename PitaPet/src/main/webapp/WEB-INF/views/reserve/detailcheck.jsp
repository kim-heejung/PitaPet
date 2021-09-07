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
	#reserveDetailCheck>div{
		text-align:center;
	}
	
	#reserveDetailCheck>div>div{
		width:100%;
		padding-bottom:120px;
	}
	
	
	#mainTitle{
		padding:100px 0;
    	font-size: 1rem;
		color: #483834;
	}
	#mainTitle>span{
		display:block;
    	margin-bottom: 14px;
		font-size:2.8rem;
		font-weight:bold;
	}
	
	#pwdCheckForm>div{
		margin-bottom:16px;
	}
	#pwdCheckForm label{
		margin-right:4px;
	}
	
	#widthPull{
		padding:6px;
		border:1px solid #ced4da;;
		border-radius:8px;
	}
	
	#reserveDetailCheck button, #btn{
		border-radius:6px;
		padding:8px 10px;
		margin:0 4px;
		background-color:blue;
		color:white;
	}
	#reserveDetailCheck button{
		border:0;
		border-radius:6px;
		padding:8px 10px;
		margin:0 4px;
		background-color:blue;
		color:white;
	}
	#btn{
		display:inline;
		border-radius:6px;
		padding:10px;
		margin:0 4px;
		background-color:blue;
		color:white;
	}
</style>
</head>
<body>
<div id="reserveDetailCheck">
	<header-component :cpath="cpath" :id="id"></header-component>
	<div class="board-wrap">
		<div class="container">
			<h1 id="mainTitle">
				<span>상담 예약</span>
				핏어펫(Pit a Pet) 방문예약은 인터넷으로 가능합니다. 핏어펫(Pit a Pet)은 모든 문의사항을 친절하게
				상담해 드리고 있습니다.
			</h1>
			<h3>비밀글 보기</h3>
			<p>
				이 글은 비밀글 입니다.
				<br /> 
				비밀번호를 입력해주세요
			</p>
			<form id="pwdCheckForm" action="${pageContext.request.contextPath}/reserve/detailcheck.do?num=${num}" method="post">
				<div>
					<label for="pwd">비밀번호</label>
					<input id="widthPull" type="password" name="pwd" id="pwd"/>
				</div>
				<a id="btn" href="">목록보기</a>
				<button type="submit">확인</button>
			</form>
		</div>
	</div>
	
	<footer-component></footer-component>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script>
	const base_url="http://localhost:8888/spring";
	new Vue({
	    el : "#reserveDetailCheck",
	    data:{
			cpath: "${pageContext.request.contextPath}",
			id: "${sessionScope.id}",
		   }
	  });	
</script>
</body>
</html>
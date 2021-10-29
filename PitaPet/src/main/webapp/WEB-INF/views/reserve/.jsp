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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />
<style>
	.board-wrap{
		text-align:center;
	}
	
	
	.container{
		width:100%;
	}
	
	
	/*
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
	*/
	
	
	.pwdCheckTitle{
		font-weight:bold;
	}
	
	
	.pwdCheckFormList{
		margin-bottom:16px;
	}
	.pwdCheckFormLabel{
		margin-right:4px;
	}
	
	.widthPull{
		padding:6px;
		border:1px solid #ced4da;
	}
	
	.checkform-btn{
		margin:0 4px;
	}
	
	
	.board-wrap{
		padding-bottom:120px;
		min-height:0;
	}
</style>
</head>
<body>
<div id="reserveDetailCheck">
	<header-component :cpath="cpath" :id="id"></header-component>
	<page-category class="reserve" :name="'상담예약'"></page-category>
	<div class="board-wrap">
		<page-category class="reserve" :cpath="cpath" :index="5"></page-category>
		<div class="container">
			<!--  
			<h1 id="mainTitle">
				<span>상담 예약</span>
				핏어펫(Pit a Pet) 방문예약은 인터넷으로 가능합니다. 핏어펫(Pit a Pet)은 모든 문의사항을 친절하게
				상담해 드리고 있습니다.
			</h1>
			-->
			<h3 class="pwdCheckTitle">비밀글 보기</h3>
			<p>
				이 글은 비밀글 입니다.
				<br /> 
				비밀번호를 입력해 주세요.
			</p>
			<form style="padding-bottom:0" class="pwdCheckForm" action="${pageContext.request.contextPath}/reserve/detailcheck.do?num=${num}" method="post">
				<div class="pwdCheckFormList">
					<label class="pwdCheckFormLabel" for="pwd">비밀번호</label>
					<input class="widthPull" type="password" name="pwd" id="pwd"/>
				</div>
				<div class=" btn-wrap btn-center">
					<a style="display:inline-block; border:1px solid black;" class="btn btn-s btn-black checkform-btn" href="${pageContext.request.contextPath}/reserve/list.do">목록보기</a>
					<button class="btn btn-s btn-white checkform-btn" type="submit">확인</button>
				</div>
			</form>
		</div>
	</div>
	
	<footer-component></footer-component>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/page_category.js"></script>
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
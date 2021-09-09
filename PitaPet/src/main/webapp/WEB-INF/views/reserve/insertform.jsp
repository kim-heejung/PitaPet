<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<jsp:include page="/resources/resource.jsp"></jsp:include>
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
	
	
	.insertFormList{
		text-align:left;
		margin:20px 0;
	}
	.insertFormLabel{
		display:block;
		margin-bottom:4px;
		font-size:1.2rem;
	}
	
	.scopeCheckbox{
		display:flex;
	}
	.scopeLabel{
		margin-right:14px;
	}
	.scopeInput{
		margin-right:4px;
	}
	
	.widthPull{
		width:100%;
		padding:8px;
		border:1px solid #ced4da;;
		border-radius:8px;
	}
	
	.insertButton{
		border:0;
		border-radius:6px;
		padding:10px 12px;
		margin:6px 8px 0 8px;
		background-color:#bb9b6a;
		color:white;
		font-size:1.1rem;
	}
</style>
</head>
<body>
<div id="reserveInsert">
	<header-component :cpath="cpath" :id="id"></header-component>
	<div class="board-wrap">
		<page-category class="reserve" :name="'상담예약'"></page-category>
		<div class="container">
		<!--  
		<h1 id="mainTitle">
			<span>상담 예약</span>
			핏어펫(Pit a Pet) 방문예약은 인터넷으로 가능합니다. 핏어펫(Pit a Pet)은 모든 문의사항을 친절하게
			상담해 드리고 있습니다.
		</h1>
		-->
			<form id="insertForm" action="${pageContext.request.contextPath}/api/reserve/insert.do" method="post">
			      	<div class="insertFormList">
			         	<label class="insertFormLabel" for="scope">공개 여부</label>
			         	<div class="scopeCheckbox">
			         		<label class="insertFormLabel scopeLabel"><input class="scopeInput" type="radio" name="scope" id="scope" value="public"/>공개글</label>
			         		<label class="insertFormLabel scopeLabel"><input class="scopeInput" type="radio" name="scope" id="scope" value="private"/>비밀글</label>
			         	</div>
			      	</div>
			      	<div class="insertFormList">
			         	<label class="insertFormLabel" for="pwd">비밀번호</label>
			         	<input class="widthPull" type="password" name="pwd" id="pwd"/>
			      	</div>
			      	<div class="insertFormList">
			      		<label class="insertFormLabel" for="shelterName">지점</label>
			      		<select class="widthPull" name="shelterName" id="shelterName">
				   			<option value="지점 선택">지점 선택</option>
				   			<option value="서울">서울</option>
				   			<option value="인천">인천</option>
				   			<option value="부산">부산</option>
						</select>
			      	</div>
			      	<div class="insertFormList">
			         	<label class="insertFormLabel" for="title">제목</label>
			         	<input class="widthPull" type="text" name="title" id="title"/>
			      	</div>
			      	<div class="insertFormList">
			      		<label class="insertFormLabel" for="reservedDate">날짜</label>
			      		<select class="widthPull" name="reservedDate" id="reservedDate">
				   			<option value="날짜 선택">날짜 선택</option>
				   			<option value="9월 1일">9월 1일</option>
				   			<option value="9월 2일">9월 2일</option>
				   			<option value="9월 3일">9월 3일</option>
				   			<option value="9월 6일">9월 6일</option>
				   			<option value="9월 7일">9월 7일</option>
						</select>
			      	</div>
			      	<div class="insertFormList">
			         	<label class="insertFormLabel" for="reservedTime">시간</label>
			         	<select class="widthPull" name="reservedTime" id="reservedTime">
				   			<option value="시간 선택">시간 선택</option>
				   			<option value="10:00">10:00</option>
				   			<option value="11:00">11:00</option>
				   			<option value="13:00">13:00</option>
				   			<option value="14:00">14:00</option>
				   			<option value="15:00">15:00</option>
						</select>
			      	</div>
			      	<div class="insertFormList">
			         	<label class="insertFormLabel" for="name">이름</label>
			         	<input class="widthPull" type="text" name="name" id="name"/>
			      	</div>
			      	<div class="insertFormList">
			         	<label class="insertFormLabel" for="phoneNumber">연락처</label>
			         	<input class="widthPull" type="text" name="phoneNumber" id="phoneNumber"/>
			      	</div>
			      	<div class="insertFormList">
			         	<label class="insertFormLabel" for="title">내용</label>
			         	<textarea class="widthPull" name="content" id="" cols="30" rows="10"></textarea>
			      	</div>
			      	<button class="insertButton" type="reset">최소</button>
			      	<button class="insertButton submitButton" type="submit">등록</button>
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
	    el : "#reserveInsert",
	    data:{
			cpath: "${pageContext.request.contextPath}",
			id: "${sessionScope.id}",
		   }
	  });	
</script>
</body>
</html>
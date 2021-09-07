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
	#reserveInsert>div{
		text-align:center;
	}
	
	#reserveInsert>div>div{
		width:100%;
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
	
	
	#insertForm>div{
		text-align:left;
		margin:14px 0;
	}
	#insertForm>div>label{
		display:block;
		margin-bottom:4px;
	}
	
	.widthPull{
		width:100%;
		padding:6px;
		border:1px solid #ced4da;;
		border-radius:8px;
	}
	
	#scopeCheckbox{
		display:flex;
	}
	#scopeCheckbox>label{
		margin-right:14px;
	}
	#scopeCheckbox>label>input{
		margin-right:4px;
	}
	
	#insertForm>button{
		border:0;
		border-radius:6px;
		padding:8px 10px;
		margin:0 4px;
		background-color:blue;
		color:white;
	}
</style>
</head>
<body>
<div id="reserveInsert">
	<header-component :cpath="cpath" :id="id"></header-component>
	<div class="board-wrap">
		<div class="container">
		<h1 id="mainTitle">
			<span>상담 예약</span>
			핏어펫(Pit a Pet) 방문예약은 인터넷으로 가능합니다. 핏어펫(Pit a Pet)은 모든 문의사항을 친절하게
			상담해 드리고 있습니다.
		</h1>
			<form id="insertForm" action="${pageContext.request.contextPath}/api/reserve/insert.do" method="post">
			      	<div>
			         	<label for="scope">공개 여부</label>
			         	<div id="scopeCheckbox">
			         		<label><input type="checkbox" name="scope" id="scope" value="공개글"/>공개글</label>
			         		<label><input type="checkbox" name="scope" id="scope" value="비밀글"/>비밀글</label>
			         	</div>
			      	</div>
			      	<div>
			         	<label for="pwd">비밀번호</label>
			         	<input class="widthPull" type="text" name="pwd" id="pwd"/>
			      	</div>
			      	<div>
			      		<label for="shelterName">지점</label>
			      		<select class="widthPull" name="shelterName" id="shelterName">
				   			<option value="지점 선택">지점 선택</option>
				   			<option value="서울">서울</option>
				   			<option value="인천">인천</option>
				   			<option value="부산">부산</option>
						</select>
			      	</div>
			      	<div>
			         	<label for="title">제목</label>
			         	<input class="widthPull" type="text" name="title" id="title"/>
			      	</div>
			      	
			      	<div>
			      		<label for="reservedDate">날짜</label>
			      		<select class="widthPull" name="reservedDate" id="reservedDate">
				   			<option value="날짜 선택">날짜 선택</option>
				   			<option value="9월 1일">9월 1일</option>
				   			<option value="9월 2일">9월 2일</option>
				   			<option value="9월 3일">9월 3일</option>
				   			<option value="9월 6일">9월 6일</option>
				   			<option value="9월 7일">9월 7일</option>
						</select>
			      	</div>
			      	<div>
			         	<label for="reservedTime">시간</label>
			         	<select class="widthPull" name="reservedTime" id="reservedTime">
				   			<option value="시간 선택">시간 선택</option>
				   			<option value="10:00">10:00</option>
				   			<option value="11:00">11:00</option>
				   			<option value="13:00">13:00</option>
				   			<option value="14:00">14:00</option>
				   			<option value="15:00">15:00</option>
						</select>
			      	</div>
			      	<div>
			         	<label for="name">이름</label>
			         	<input class="widthPull" type="text" name="name" id="name"/>
			      	</div>
			      	<div>
			         	<label for="phoneNumber">연락처</label>
			         	<input class="widthPull" type="text" name="phoneNumber" id="phoneNumber"/>
			      	</div>
			      	<div>
			         	<label for="title">내용</label>
			         	<textarea class="widthPull" name="content" id="" cols="30" rows="10"></textarea>
			      	</div>
			      	<button type="reset">최소</button>
			      	<button type="submit">등록</button>
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
	    el : "#reserveInsert",
	    data:{
			cpath: "${pageContext.request.contextPath}",
			id: "${sessionScope.id}",
		   }
	  });	
</script>
</body>
</html>
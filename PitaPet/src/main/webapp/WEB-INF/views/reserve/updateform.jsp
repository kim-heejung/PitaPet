<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<jsp:include page="/resources/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />
<style>
	#reserveUpdate>div{
		text-align:center;
	}
	
	#reserveUpdate>div>div{
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
	
	
	#updateForm>div{
		text-align:left;
		margin:14px 0;
	}
	#updateForm>div>label{
		display:block;
		margin-bottom:4px;
	}
	
	.widthPull{
		width:100%;
		padding:6px;
		border:1px solid #ced4da;;
		border-radius:8px;
	}
	
	#updateForm>button{
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
<div id="reserveUpdate">
	<header-component :cpath="cpath" :id="id"></header-component>
	<div class="board-wrap">
		<div class="container">
			<h1 id="mainTitle">
				<span>상담 예약</span>
				핏어펫(Pit a Pet) 방문예약은 인터넷으로 가능합니다. 핏어펫(Pit a Pet)은 모든 문의사항을 친절하게
				상담해 드리고 있습니다.
			</h1>
			<form id="updateForm" action="${pageContext.request.contextPath}/api/reserve/update.do" method="post">
				<input type="hidden" name="num" value="${dto.num}"/>
				<div>
					<label for="shelterName">지점</label> 
					<select class="widthPull" name="shelterName" id="shelterName">
						<option value="지점 선택">지점 선택</option>
						<option value="서울" ${dto.shelterName eq "서울" ? "selected" : ""}>서울</option>
						<option value="인천" ${dto.shelterName eq "인천" ? "selected" : ""}>인천</option>
						<option value="부산" ${dto.shelterName eq "부산" ? "selected" : ""}>부산</option>
					</select>
				</div>
				<div>
					<label for="title">제목</label> 
					<input class="widthPull" type="text" name="title" id="title" value="${dto.title}"/>
				</div>
				<div>
					<label for="reservedDate">날짜</label> 
					<select class="widthPull" name="reservedDate" id="reservedDate">
						<option value="날짜 선택">날짜 선택</option>
						<option value="9월 1일" ${dto.reservedDate eq "9월 1일" ? "selected" : ""}>9월 1일</option>
						<option value="9월 2일" ${dto.reservedDate eq "9월 2일" ? "selected" : ""}>9월 2일</option>
						<option value="9월 3일" ${dto.reservedDate eq "9월 3일" ? "selected" : ""}>9월 3일</option>
						<option value="9월 6일" ${dto.reservedDate eq "9월 6일" ? "selected" : ""}>9월 6일</option>
						<option value="9월 7일" ${dto.reservedDate eq "9월 7일" ? "selected" : ""}>9월 7일</option>
					</select>
				</div>
				<div>
					<label for="reservedTime">시간</label> 
					<select class="widthPull" name="reservedTime" id="reservedTime">
						<option value="시간 선택">시간 선택</option>
						<option value="10:00" ${dto.reservedTime eq "10:00" ? "selected" : ""}>10:00</option>
						<option value="11:00" ${dto.reservedTime eq "11:00" ? "selected" : ""}>11:00</option>
						<option value="13:00" ${dto.reservedTime eq "13:00" ? "selected" : ""}>13:00</option>
						<option value="14:00" ${dto.reservedTime eq "14:00" ? "selected" : ""}>14:00</option>
						<option value="15:00" ${dto.reservedTime eq "15:00" ? "selected" : ""}>15:00</option>
					</select>
				</div>
				<div>
					<label for="name">이름</label> 
					<input class="widthPull" type="text" name="name" id="name" value="${dto.name}"/>
				</div>
				<div>
					<label for="phoneNumber">연락처</label> 
					<input class="widthPull" type="text" name="phoneNumber" id="phoneNumber" value="${dto.phoneNumber}"/>
				</div>
				<div>
					<label for="title">내용</label>
					<textarea class="widthPull" name="content" id="" cols="30" rows="10">${dto.content }</textarea>
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
	    el : "#reserveUpdate",
	    data:{
			cpath: "${pageContext.request.contextPath}",
			id: "${sessionScope.id}",
		   }
	  });	
</script>
</body>
</html>
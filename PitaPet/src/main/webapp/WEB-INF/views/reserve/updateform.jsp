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
</head>
<body>
<div id="reserveUpdate">
	<header-component :cpath="cpath" :id="id"></header-component>
	<page-category class="reserve" :name="'상담예약'"></page-category>
	<div class="board-wrap form-wrap">
		<page-category class="reserve" :cpath="cpath" :index="5"></page-category>
		<div class="container">
			<form id="insertForm" action="${pageContext.request.contextPath}/api/reserve/update.do" method="post">
			      	<input type="hidden" name="num" value="${dto.num}"/>
			      	<div class="mb-3 insertFormList">
			         	<label class="form-label" for="scope">공개 여부</label>
			         	<div>
			         		<label class="form-check-label insertFormLabel scopeLabel">
			         			<input class="form-check-input scopeInput" type="radio" name="scope" 
			         			id="scope" value="public" ${dto.scope eq 'public' ? "checked" : "" }/>
			         			공개글
			         		</label>
			         		<label class="form-check-label insertFormLabel scopeLabel">
			         			<input class="form-check-input scopeInput" type="radio" name="scope" 
			         			id="scope" value="private" ${dto.scope eq 'private' ? "checked" : "" }/>
			         			비밀글
			         		</label>
			         	</div>
			      	</div>
			      	<div class="mb-3 insertFormList">
			         	<label class="form-label" for="pwd">비밀번호</label>
			         	<input class="form-control" type="password" name="pwd" id="pwd"/>
			      	</div>
			      	<div class="mb-3 insertFormList">
			      		<label class="form-label" for="shelterName">보호소 선택</label>
			      		<select class="form-select" name="shelterName" id="shelterName">
				   			<option value="">보호소 선택</option>
				   			<option value="강동리본센터" ${dto.shelterName eq "강동리본센터" ? "selected" : ""}>강동리본센터</option>
				   			<option value="남양유기견보호센터" ${dto.shelterName eq "남양유기견보호센터" ? "selected" : ""}>남양유기견보호센터</option>
				   			<option value="위더스동물보호센터" ${dto.shelterName eq "위더스동물보호센터" ? "selected" : ""}>위더스동물보호센터</option>
				   			<option value="하얀비둘기" ${dto.shelterName eq "하얀비둘기" ? "selected" : ""}>하얀비둘기</option>
				   			<option value="제주동물보호센터" ${dto.shelterName eq "제주동물보호센터" ? "selected" : ""}>제주동물보호센터</option>
							<option value="광주동물보호소" ${dto.shelterName eq "광주동물보호소" ? "selected" : ""}>광주동물보호소</option>
				   			<option value="강릉시동물사랑센터" ${dto.shelterName eq "강릉시동물사랑센터" ? "selected" : ""}>강릉시동물사랑센터</option>
				   			<option value="에이콘임시보호소" ${dto.shelterName eq "에이콘임시보호소" ? "selected" : ""}>에이콘임시보호소</option>
						</select>
			      	</div>
			      	<div class="mb-3 insertFormList">
			         	<label class="form-label" for="title">제목</label>
			         	<input class="form-control" type="text" name="title" id="title" value="${dto.title}"/>
			      	</div>
			      	<div class="mb-3 insertFormList">
			      		<label class="form-label" for="reservedDate">날짜</label>
			      		<select class="form-select" name="reservedDate" id="reservedDate">
				   			<option value="">날짜 선택</option>
				   			<option value="9월 13일" ${dto.reservedDate eq "9월 13일" ? "selected" : ""}>9월 13일</option>
				   			<option value="9월 14일" ${dto.reservedDate eq "9월 14일" ? "selected" : ""}>9월 14일</option>
				   			<option value="9월 15일" ${dto.reservedDate eq "9월 15일" ? "selected" : ""}>9월 15일</option>
				   			<option value="9월 16일" ${dto.reservedDate eq "9월 16일" ? "selected" : ""}>9월 16일</option>
				   			<option value="9월 17일" ${dto.reservedDate eq "9월 17일" ? "selected" : ""}>9월 17일</option>
						</select>
			      	</div>
			      	<div class="mb-3 insertFormList">
			         	<label class="form-label" for="reservedTime">시간</label>
			         	<select class="form-select" name="reservedTime" id="reservedTime">
				   			<option value="">시간 선택</option>
				   			<option value="10:00" ${dto.reservedTime eq "10:00" ? "selected" : ""}>10:00</option>
				   			<option value="11:00" ${dto.reservedTime eq "11:00" ? "selected" : ""}>11:00</option>
				   			<option value="13:00" ${dto.reservedTime eq "13:00" ? "selected" : ""}>13:00</option>
				   			<option value="14:00" ${dto.reservedTime eq "14:00" ? "selected" : ""}>14:00</option>
				   			<option value="15:00" ${dto.reservedTime eq "15:00" ? "selected" : ""}>15:00</option>
						</select>
			      	</div>
			      	<div class="mb-3 insertFormList">
			         	<label class="form-label" for="name">이름</label>
			         	<input class="form-control" type="text" name="name" id="name" value="${dto.name}"/>
			      	</div>
			      	<div class="mb-3 insertFormList">
			         	<label class="form-label" for="phoneNumber">연락처</label>
			         	<input class="form-control" type="text" name="phoneNumber" id="phoneNumber" value="${dto.phoneNumber}"/>
			      	</div>
			      	<div class="mb-3 insertFormList">
			         	<label class="form-label" for="title">내용</label>
			         	<textarea class="form-control" name="content" id="" cols="30" rows="10">${dto.content }</textarea>
			      	</div>
			      	<div class="formBtn btn-wrap btn-center">
			      		<button class="formBtnList btn btn-m btn-white" type="reset">최소</button>
			      		<button class="formBtnList btn btn-m btn-black" type="submit">등록</button>
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
	    el : "#reserveUpdate",
	    data:{
			cpath: "${pageContext.request.contextPath}",
			id: "${sessionScope.id}",
		   }
	  });	
</script>
</body>
</html>
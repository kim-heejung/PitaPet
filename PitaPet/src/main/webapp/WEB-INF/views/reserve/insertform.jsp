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
.require-star{
	color:red;
}
</style>
</head>
<body>
<div id="reserveInsert">
	<header-component :cpath="cpath" :id="id"></header-component>
	<page-category class="reserve" :name="'상담예약'"></page-category>
	<div class="board-wrap form-wrap">
		<page-category class="reserve" :cpath="cpath" :index="5"></page-category>
		<div class="container">
			<form id="insertForm" action="${pageContext.request.contextPath}/api/reserve/insert.do" method="post">
			      	<div class="mb-3 insertFormList">
			         	<label class="form-label" for="scope">공개 여부</label>
			         	<div>
			         		<label class="form-check-label insertFormLabel scopeLabel"><input class="form-check-input scopeInput scope-input-public" type="radio" name="scope" id="public" value="public"/>공개글</label>
			         		<label class="form-check-label insertFormLabel scopeLabel"><input class="form-check-input scopeInput scope-input-private" type="radio" name="scope" id="private" value="private"/>비밀글</label>
			         	</div>
			      	</div>
			      	<div class="mb-3 insertFormList">
			         	<label class="form-label" for="pwd">비밀번호</label>
			         	<input class="form-control" type="password" name="pwd" id="pwd"/>
			      	</div>
			      	<div class="mb-3 insertFormList">
			      		<label class="form-label" for="shelterName">보호소 <span class="require-star">*</span></label>
			      		<select class="form-select require" name="shelterName" id="shelterName">
				   			<option value="">보호소 선택</option>
				   			<option value="강동리본센터">강동리본센터</option>
				   			<option value="남양유기견보호센터">남양유기견보호센터</option>
				   			<option value="위더스동물보호센터">위더스동물보호센터</option>
				   			<option value="하얀비둘기">하얀비둘기</option>
				   			<option value="제주동물보호센터">제주동물보호센터</option>
				   			<option value="광주동물보호소">광주동물보호소</option>
				   			<option value="강릉시동물사랑센터">강릉시동물사랑센터</option>
				   			<option value="에이콘임시보호소">에이콘임시보호소</option>
						</select>
			      	</div>
			      	<div class="mb-3 insertFormList">
			         	<label class="form-label" for="title">제목 <span class="require-star">*</span></label>
			         	<input class="form-control require" type="text" name="title" id="title"/>
			      	</div>
			      	<div class="mb-3 insertFormList">
			      		<label class="form-label" for="reservedDate">날짜 <span class="require-star">*</span></label>
			      		<select class="form-select require" name="reservedDate" id="reservedDate">
				   			<option value="">날짜 선택</option>
				   			<option value="9월 13일">9월 13일</option>
				   			<option value="9월 14일">9월 14일</option>
				   			<option value="9월 15일">9월 15일</option>
				   			<option value="9월 16일">9월 16일</option>
				   			<option value="9월 17일">9월 17일</option>
						</select>
			      	</div>
			      	<div class="mb-3 insertFormList">
			         	<label class="form-label" for="reservedTime">시간 <span class="require-star">*</span></label>
			         	<select class="form-select require" name="reservedTime" id="reservedTime">
				   			<option value="">시간 선택</option>
				   			<option value="10:00">10:00</option>
				   			<option value="11:00">11:00</option>
				   			<option value="13:00">13:00</option>
				   			<option value="14:00">14:00</option>
				   			<option value="15:00">15:00</option>
						</select>
			      	</div>
			      	<div class="mb-3 insertFormList">
			         	<label class="form-label" for="name">이름 <span class="require-star">*</span></label>
			         	<input class="form-control require" type="text" name="name" id="name"/>
			      	</div>
			      	<div class="mb-3 insertFormList">
			         	<label class="form-label" for="phoneNumber">연락처 <span class="require-star">*</span></label>
			         	<input class="form-control require" type="text" name="phoneNumber" id="phoneNumber"/>
			      	</div>
			      	<div class="mb-3 insertFormList">
			         	<label class="form-label" for="title">내용</label>
			         	<textarea class="form-control" name="content" id="" cols="30" rows="10"></textarea>
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
	    el : "#reserveInsert",
	    data:{
			cpath: "${pageContext.request.contextPath}",
			id: "${sessionScope.id}",
		   }
	  });
	
	
	let pwdInput=document.getElementById("pwd");
	
	document.querySelector(".scope-input-private").addEventListener("click", function(e){
		let scopePri=document.querySelector('input[name="scope"]:checked').value;
		if(scopePri=="private"){
			pwdInput.setAttribute("disabled", "disabled");
		}
	});
	
	document.querySelector(".scope-input-public").addEventListener("click", function(e){
		let scopePri=document.querySelector('input[name="scope"]:checked').value;
		if(scopePri=="public"){
			pwdInput.removeAttribute("disabled");
		}
	});
	
	
	document.querySelector("#insertForm").addEventListener("submit", function(e){
		for(let i=0; i<6; i++){
			let require=document.querySelectorAll(".require")[i].value;
			let scopePri=document.querySelector('input[name="scope"]:checked').value;
			if(scopePri=="private"){
				let pwd=document.querySelector("#pwd").value;
					if(pwd==""){
						alert("비밀글 확인 시 사용할 비밀번호를 입력해 주세요.");
						e.preventDefault();
						break;
					}else if(require==""){
						alert("* 표시된 필수 입력 사항을 빠짐없이 입력해 주세요.");
			            e.preventDefault();
			            break;
					}
			}else if(scopePri=="public" && require==""){
				alert("* 표시된 필수 입력 사항을 빠짐없이 입력해 주세요.");
	            e.preventDefault();
	            break;
			}
		}
	});
</script>
</body>
</html>
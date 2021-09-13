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
</head>
<body>
	<div id="adoptUpdate">
		<header-component :cpath="cpath" :id="id"></header-component>
		<div class="board-wrap form-wrap">
			<page-category :cpath="cpath" :index="0"></page-category>
			<div class="container">
			   	<form class="updateForm" action="${pageContext.request.contextPath}/api/adopt/update.do" method="post" enctype="multipart/form-data">
			      	<input type="hidden" name="num" value="${dto.num}"/>
			      	<div class="mb-3 updateFormList">
			      		<label class="form-label">동물 분류</label>
			      		<select class="form-select" name="animalType" id="animalType">
			      			<option value="">선택</option>
				   			<option value="dog" ${dto.animalType eq 'dog' ? "selected" : "" }>dog</option>
				   			<option value="cat" ${dto.animalType eq 'cat' ? "selected" : "" }>cat</option>
						</select>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="title" >제목</label>
			         	<input class="form-control" type="text" name="title" id="title" value="${dto.title}"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="image">이미지</label>
			         	<input class="form-control" type="file" name="image" id="image"
			            	accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="breed">품종</label>
			         	<input class="form-control" type="text" name="breed" id="breed" value="${dto.breed}"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="petName">이름</label>
			         	<input class="form-control" type="text" name="petName" id="petName" value="${dto.petName}"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="petAge">나이</label>
			         	<input class="form-control" type="text" name="petAge" id="petAge" value="${dto.petAge}"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="petGender">성별</label>
			         	<input class="form-control" type="text" name="petGender" id="petGender" value="${dto.petGender}"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="vaccination">예방 접종</label>
			         	<input class="form-control" type="text" name="vaccination" id="vaccination" value="${dto.vaccination}"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="neutralization">중성화</label>
			         	<input class="form-control" type="text" name="neutralization" id="neutralization" value="${dto.neutralization}"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="findDate">맡겨진 날짜</label>
			         	<input class="form-control" type="text" name="findDate" id="findDate" value="${dto.findDate}"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="caption">설명</label>
						<textarea class="form-control" type="text" name="caption" id="caption"/>${dto.caption}</textarea>
			      	</div>
			      	<div class="formBtn btn-wrap btn-center">
			      		<button class="formBtnList btn btn-m btn-white" type="reset">취소</button>
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
  new Vue({
      el : "#adoptUpdate",
      data:{
			cpath: "${pageContext.request.contextPath}",
			id: "${sessionScope.id}"
		},
  });
</script>
</body>
</html>
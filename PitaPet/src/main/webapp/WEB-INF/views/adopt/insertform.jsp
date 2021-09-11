<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<jsp:include page="/resources/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />
<style>
	.insertForm{
		text-align:left;
	}	
	.insertFormList{
		padding-bottom:6px;
	}
	
	.formBtn{
		text-align:center;
		margin-top:32px;
	}
	.formBtnList{
		margin:0 4px;
	}
</style>
</head>
<body>
	<div id="adoptInsert">
		<header-component :cpath="cpath" :id="id"></header-component>
		<div class="board-wrap">
			<page-category :cpath="cpath" :index="0"></page-category>
			<div class="container">
			   	<form class="insertForm" action="${pageContext.request.contextPath}/api/adopt/insert.do" method="post" enctype="multipart/form-data">
			      	<div class="mb-3 insertFormList">
			      		<label class="form-label">동물 분류</label>
			      		<select class="form-select" name="animalType" id="animalType">
			      			<option value="">선택</option>
				   			<option value="dog">dog</option>
				   			<option value="cat">cat</option>
						</select>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="title" >제목</label>
			         	<input class="form-control" type="text" name="title" id="title"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="image">이미지</label>
			         	<input class="form-control" type="file" name="image" id="image"
			            	accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="breed">품종</label>
			         	<input class="form-control" type="text" name="breed" id="breed"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="petName">이름</label>
			         	<input class="form-control" type="text" name="petName" id="petName"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="petAge">나이</label>
			         	<input class="form-control" type="text" name="petAge" id="petAge"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="petGender">성별</label>
			         	<input class="form-control" type="text" name="petGender" id="petGender"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="vaccination">예방 접종</label>
			         	<input class="form-control" type="text" name="vaccination" id="vaccination"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="neutralization">중성화</label>
			         	<input class="form-control" type="text" name="neutralization" id="neutralization"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="findDate">맡겨진 날짜</label>
			         	<input class="form-control" type="text" name="findDate" id="findDate"/>
			      	</div>
			      	<div class="mb-3">
			         	<label class="form-label" for="caption">설명</label>
						<textarea class="form-control" type="text" name="caption" id="caption"/></textarea>
			      	</div>
			      	<div class="formBtn">
			      		<button class="btn btn-primary formBtnList" type="reset">취소</button>
			      		<button class="btn btn-primary formBtnList" type="submit">등록</button>
			      	</div>
			   	</form>
			</div>
		</div>
		<footer-component></footer-component>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/page_category.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script>
  new Vue({
      el : "#adoptInsert",
      data:{
			cpath: "${pageContext.request.contextPath}",
			id: "${sessionScope.id}"
		},
  });
</script>
</html>
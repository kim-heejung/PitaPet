<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
	<jsp:include page="/resources/resource.jsp"></jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />
</head>
<body>
	<div id="adoptInsert">
		<header-component :cpath="cpath" :id="id"></header-component>
		<div class="board-wrap">
			<page-category :name="'입양하기'"></page-category>
			<div class="container">
			   	<h1>이미지 업로드 폼</h1>
			   	<form action="${pageContext.request.contextPath}/api/adopt/insert.do" method="post" enctype="multipart/form-data">
			      	<div>
			      		<label>동물 분류</label>
			      		<select name="animalType" id="animalType">
			      			<option value="">선택</option>
				   			<option value="dog">dog</option>
				   			<option value="cat">cat</option>
						</select>
			      	</div>
			      	<div>
			         	<label for="title">제목</label>
			         	<input type="text" name="title" id="title"/>
			      	</div>
			      	<div>
			         	<label for="image">이미지</label>
			         	<input type="file" name="image" id="image"
			            	accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
			      	</div>
			      	<div>
			         	<label for="breed">품종</label>
			         	<input type="text" name="breed" id="breed"/>
			      	</div>
			      	<div>
			         	<label for="petName">이름</label>
			         	<input type="text" name="petName" id="petName"/>
			      	</div>
			      	<div>
			         	<label for="petAge">나이</label>
			         	<input type="text" name="petAge" id="petAge"/>
			      	</div>
			      	<div>
			         	<label for="petGender">성별</label>
			         	<input type="text" name="petGender" id="petGender"/>
			      	</div>
			      	<div>
			         	<label for="vaccination">예방 접종</label>
			         	<input type="text" name="vaccination" id="vaccination"/>
			      	</div>
			      	<div>
			         	<label for="neutralization">중성화</label>
			         	<input type="text" name="neutralization" id="neutralization"/>
			      	</div>
			      	<div>
			         	<label for="findDate">맡겨진 날짜</label>
			         	<input type="text" name="findDate" id="findDate"/>
			      	</div>
			      	<div>
			         	<label for="caption">설명</label>
						<textarea type="text" name="caption" id="caption"/></textarea>
			      	</div>
			      	<button type="reset">취소</button>
			      	<button type="submit">등록</button>
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
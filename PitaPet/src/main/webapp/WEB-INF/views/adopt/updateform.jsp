<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<%-- bootstrap 읽어오기 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
</head>
<body>
	<div class="container">
	   	<h1>이미지 업로드 폼</h1>
	   	<div class="container">
	   	<form action="${pageContext.request.contextPath}/api/adopt/update.do" method="post" enctype="multipart/form-data">
	      	<input type="hidden" name="num" value="${dto.num}"/>
	      	<div>
	         	<label for="title">제목</label>
	         	<input type="text" name="title" id="title" value="${dto.title}"/>
	      	</div>
	      	
	        <div>
	         	<label for="image">이미지</label>
	         	<input type="file" name="image" id="image"
	            	accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
	      	
	      	</div>
	      	<div>
	         	<label for="breed">품종</label>
	         	<input type="text" name="breed" id="breed" value="${dto.breed}"/>
	      	</div>
	      	<div>
	         	<label for="petName">이름</label>
	         	<input type="text" name="petName" id="petName" value="${dto.petName}"/>
	      	</div>
	      	<div>
	         	<label for="petAge">나이</label>
	         	<input type="text" name="petAge" id="petAge" value="${dto.petAge}"/>
	      	</div>
	      	<div>
	         	<label for="petGender">성별</label>
	         	<input type="text" name="petGender" id="petGender" value="${dto.petGender}"/>
	      	</div>
	      	<div>
	         	<label for="vaccination">예방 접종</label>
	         	<input type="text" name="vaccination" id="vaccination" value="${dto.vaccination}"/>
	      	</div>
	      	<div>
	         	<label for="neutralization">중성화</label>
	         	<input type="text" name="neutralization" id="neutralization" value="${dto.neutralization}"/>
	      	</div>
	      	<div>
	         	<label for="findDate">맡겨진 날짜</label>
	         	<input type="text" name="findDate" id="findDate" value="${dto.findDate}"/>
	      	</div>
	      	<div>
	         	<label for="caption">설명</label>
				<textarea type="text" name="caption" id="caption"/>${dto.caption}</textarea>
	      	</div>
	      	<button type="reset">취소</button>
	      	<button type="submit">등록</button>
	   	</form>
	</div>
</body>
</html>
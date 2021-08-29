<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pit a pet</title>
</head>
<body>
	<div class="container">
	   	<h1>이미지 업로드 폼</h1>
	   	<form action="${pageContext.request.contextPath}/api/adopt/insert.do" method="post" enctype="multipart/form-data">
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
</body>
</html>
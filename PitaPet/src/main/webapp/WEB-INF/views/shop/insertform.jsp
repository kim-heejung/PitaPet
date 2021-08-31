<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<style>
	.img-wrapper{
		display:none;
	}
</style>
</head>
<body>
<div class="container">
	<h1>상품 정보 입력</h1>
	<div class="row mt-3">
		<div class="img-wrapper col">
			<img width="300px"/>
		</div>
		<div class="col-9">
			<form action="${pageContext.request.contextPath}/shop/insert.do" method="post" id="insertForm">
				<input type="hidden" name="imgPath" id="imgPath"/>
				<div>
					<label for="category">상품 분류</label>
					<select class="form-select" name="category" id="category">
						<option value="food">사료</option>
						<option value="snack">간식</option>
						<option value="toy">장난감</option>
					</select>
					<br />
					<label for="name">상품명</label>
					<input class="form-control" type="text" name="name" id="name"/>
					<br />
					<label for="price">가격</label>
					<input class="form-control" type="text" name="price" />
					<br />
					<label for="remainCount">재고(수량)</label>
					<input class="form-control" type="text" name="remainCount" />
					<br />
				</div>
			</form>
			<form action="${pageContext.request.contextPath}/shop/ajaxUpload.do" method="post" id="ajaxForm" enctype="multipart/form-data">
				<div>
					<label for="image">이미지</label>
					<input class="form-control" type="file" name="image" id="image" 
		            		accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
				</div>
			</form>
		</div>
		
	</div>
	<br />
	<button class="btn btn-primary" id="submitBtn">등록</button>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	document.querySelector("#image").addEventListener("change",function(){
		const form=document.querySelector("#ajaxForm");
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			console.log(data);
			const path="${pageContext.request.contextPath}"+data.imgPath;
			document.querySelector(".img-wrapper img").setAttribute("src",path);
			document.querySelector(".img-wrapper").style.display="block";
			document.querySelector("#imgPath").value=data.imgPath;
		});
	});
	
	document.querySelector("#submitBtn").addEventListener("click", function(){
		document.querySelector("#insertForm").submit();
	});
</script>
</body>
</html>
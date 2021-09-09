<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<link href='https://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<jsp:include page="/resources/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<style>
	#pwd_updateform{
 	 background-image: linear-gradient(90deg, rgb(106, 33, 223), rgb(209, 51, 230));
		height:800px;
	}
	.container {
	  vertical-align: middle;
	  text-align: center;
	}
	.content {
	  width: 400px;
	  display: inline-block;
	  text-align: left;
	  background-color: whitesmoke;
	  border-radius: .7em;
	  padding: 3rem 3rem 3rem;
	}
	button {
		margin-top:50px;
		margin: 0;
  		padding: 0;
	}
	
	div.tab.btn.btn-primary {
	height: 40px;
	}
	.btn {
	  border: none;
	  font-weight: bold;
	  background-image: linear-gradient(90deg, rgb(209, 51, 230), rgb(106, 33, 223), rgb(9, 204, 204));
	  border-radius: 2rem;
	  height: 2.5rem;
	  color: whitesmoke;
	}
	h1{
		margin-bottom:30px;
	}
</style>
</head>
<body>
<div id="pwd_updateform">
	<jsp:include page="/resources/header.jsp"></jsp:include>
	<slider-component :cpath="cpath"></slider-component>
	<intro-component></intro-component>
	<review-component></review-component>
	<family-component></family-component>
	<footer-component></footer-component>
	<div class="container">
		<form class="content" action="${pageContext.request.contextPath}/users/pwd_update.do" method="post" id="myForm">
			<h1>비밀 번호 수정 폼</h1>
			<div>
				<label class="control-label" for="pwd">기존 비밀 번호 </label>
				<input class="form-control" type="password" name="pwd"/>
			</div>
			<br />
			<div>
				<label class="control-label" for="newPwd">새 비밀번호</label>
				<input class="form-control" type="password" name="newPwd" id="newPwd"/>
			</div>
			<br />
			<div>
				<label class="control-label" for="newPwd2">새 비밀번호 확인</label>
				<input class="form-control" type="password" id="newPwd2"/>
			</div>
			<br />
			<button class="btn btn-primary" type="submit">수정하기</button>
			<button class="btn btn-primary" type="reset">취소</button>
		</form>
	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	//폼에 submit 이벤트가 발생했을때 실행할 함수(비밀번호 일치 확인)
	document.querySelector("#myForm").addEventListener("submit", function(e){
		let pwd1=document.querySelector("#newPwd").value;
		let pwd2=document.querySelector("#newPwd2").value;
		//새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
		if(pwd1 != pwd2){
			alert("비밀번호를 확인 하세요!");
			e.preventDefault();//폼 전송 막기 
		}
	});
	
	new Vue({
		el:"#pwd_updateform",
		data(){
			return{
				
			}
		}
	});
</script>
</body>
</html>
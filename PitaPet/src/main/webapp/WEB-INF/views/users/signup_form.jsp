<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/signup_form.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<style>
button {
	margin-top:50px;
	 margin: 0;
  	padding: 0;
}
button.btn.btn-primary{
	margin:30px;
}
div.tab.btn.btn-primary {
	height: 40px;
}
.items {
  display: none;
  position: relative;
}
.items.active {
  display: inline-block;
}
</style>
</head>
<body>
<div class="container">
      <h1>회원가입하기 폼</h1>
     <div class="tabs">
     	<div class="tab btn btn-primary" data-tab-target="#tab1">
         	<p>일반회원</p>
       	</div>
	     <div class="tab btn btn-primary" data-tab-target="#tab2">
	        <p>보호소</p>
	     </div>
	  </div>
     <br />
      <div id="tab1" data-tab-content class="items active">
        <h2>일반회원 회원가입 폼</h2>
        	<form action="${pageContext.request.contextPath}/users/signup.do" method="post" id="myForm">
				<div>
					<label class="control-label" for="id">아이디</label>
					<input class="form-control id" type="text" name="id" id="users_id"/>
					<small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요.</small>
					<div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>
				</div>
				<div>
					<label class="control-label" for="pwd">비밀번호</label>
					<input class="form-control" type="password" name="pwd" id="users_pwd"/>
					<small class="form-text text-muted">5글자~10글자 이내로 입력하세요.</small>
					<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
				</div>
				<div>
					<label class="control-label" for="pwd">비밀번호 확인</label>
					<input class="form-control" type="password" name="pwd2" id="users_pwd2"/>
				</div>
				<br />
				<div>
					<label for="name">이름</label>
					<input class="form-control" type="text" name="name" id="users_name" />
				</div>
				<br />
				<div>
					<label class="control-label" for="phoneNumber">연락처</label>		
					<input class="form-control" type="tel" name="phoneNumber" id="users_phoneNumber"/>
				</div>
				<br />
				<div>
					<label for="birth">생년월일</label>
					<input class="form-control" type="date" name="birth" value="1998-08-20" />
				</div>
				<br />
				<div>
					<label class="control-label" for="email">이메일</label>
					<input class="form-control email" type="text" name="email" id="users_email"/>
					<div class="invalid-feedback">이메일 형식을 확인 하세요.</div>
				</div>
				<div>
					<label class="control-label" for="address">주소</label>
					<input class="form-control" type="text" name="address" id="users_address" />
				</div>
				<br />
				<div>
					<label class="control-label" for="household">가구원</label>
					<select class="form-select" name="household" id="household">
						<option value="one">1명</option>
						<option value="two">2명</option>
						<option value="three">3명이상</option>
					</select>
				</div>
				<input type="hidden" name="groupNum" value="0" />
				 <button class="btn btn-primary" type="submit">가입</button>
			</form>
      </div>
      
      <div id="tab2" data-tab-content class="items">
		<h2>보호소회원 회원가입 폼</h2>
		<form action="${pageContext.request.contextPath}/users/signup.do" method="post" id="myForm2">
			<div>
				<label class="control-label" for="id">아이디</label>
				<input class="form-control id" type="text" name="id" id="shelter_id"/>
				<small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요.</small>
				<div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>
			</div>
			<div>
				<label class="control-label" for="pwd">비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="shelter_pwd"/>
				<small class="form-text text-muted">5글자~10글자 이내로 입력하세요.</small>
				<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
			</div>
			<div>
				<label class="control-label" for="pwd">비밀번호 확인</label>
				<input class="form-control" type="password" name="pwd2" id="shelter_pwd2"/>
			</div>
			<div>
				<label class="control-label" for="name">보호소 이름</label>
				<input class="form-control" type="text" name="name" id="shelter_name"/>
			</div>
			<div>
				<label class="control-label" for="serialNum">고유번호</label>
				<input class="form-control" type="text" name="serialNum" id="serialNum"/>
				<small class="form-text text-muted">000-00-00000 형식으로 입력하세요</small>
				<div class="invalid-feedback">고유번호를 확인하세요.</div>
			</div>
			<div>
				<label class="control-label" for="address">보호소 위치</label>
				<input class="form-control" type="text" name="address" id="shelter_address" />
			</div>
			<br />
			<div>
				<label class="control-label" for="phoneNumber">연락처</label>
				<input class="form-control" type="tel" name="phoneNumber" id="shelter_phoneNumber"/>
			</div>
			<br />
			<div>
				<label class="control-label" for="email">이메일</label>
				<input class="form-control email" type="text" name="email" id="shelter_email"/>
				<div class="invalid-feedback">이메일 형식을 확인 하세요.</div>
			</div>
			<input type="hidden" name="groupNum" value="1" />
			<button class="btn btn-primary" type="submit">가입</button>
		</form>
		</div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	const tabs = document.querySelectorAll("[data-tab-target]");
	const tabcon = document.querySelectorAll("[data-tab-content]");
	tabs.forEach((tab) => {
	  tab.addEventListener("click", () => {
	    const target = document.querySelector(tab.dataset.tabTarget);
	    tabcon.forEach((tabc_all) => {
	      tabc_all.classList.remove("active");
	    });
	    target.classList.add("active");
	  });
	});
	
	let isIdValid=false;
	let isUsersPwdValid=false;
	let isShelterPwsValid=false;
	let isEmailValid=false;
	let isSerialValid=false;
	
	let ids=document.querySelectorAll(".id")
	
	for(let i=0; i<ids.length; i++){
		ids[i].addEventListener("input", function(){
			
			this.classList.remove("is-invalid");
			this.classList.remove("is-valid");
			
			let inputId=this.value;
			const reg_id=/^[a-z].{4,9}$/;
			if(!reg_id.test(inputId)){
				isIdValid=false; 
				this.classList.add("is-invalid");
				return; 
			}
			
			const self=this;
			
			//중복확인
			ajaxPromise("${pageContext.request.contextPath}/users/checkid.do","get","inputId="+inputId)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log(data);
				
				if(data.isExist){
					isIdValid=false;
					self.classList.add("is-invalid");
				}else{
					isIdValid=true;
					self.classList.add("is-valid");
				}
			});
		});
	}
	
	function checkUsersPwd(){
		document.querySelector("#users_pwd").classList.remove("is-valid");
		document.querySelector("#users_pwd").classList.remove("is-invalid");
		
		const pwd=document.querySelector("#users_pwd").value;
		const pwd2=document.querySelector("#users_pwd2").value;

		const reg_pwd=/^.{5,10}$/;
		if(!reg_pwd.test(pwd)){
			isUsersPwdValid=false;
			document.querySelector("#users_pwd").classList.add("is-invalid");
			return;
		}
		if(pwd!=pwd2){
			isUsersPwdValid=false;
			document.querySelector("#users_pwd").classList.add("is-invalid");
		}else{
			isUsersPwdValid=true;
			document.querySelector("#users_pwd").classList.add("is-valid");
		}
		
		
	}
	
	document.querySelector("#users_pwd").addEventListener("input",checkUsersPwd);
	document.querySelector("#users_pwd2").addEventListener("input",checkUsersPwd);
	
	
	function checkShelterPwd(){
		document.querySelector("#shelter_pwd").classList.remove("is-valid");
		document.querySelector("#shelter_pwd").classList.remove("is-invalid");
		
		const pwd=document.querySelector("#shelter_pwd").value;
		const pwd2=document.querySelector("#shelter_pwd2").value;

		const reg_pwd=/^.{5,10}$/;
		if(!reg_pwd.test(pwd)){
			isShelterPwdValid=false;
			document.querySelector("#shelter_pwd").classList.add("is-invalid");
			return;
		}
		if(pwd!=pwd2){
			isShelterPwdValid=false;
			document.querySelector("#shelter_pwd").classList.add("is-invalid");
		}else{
			isShelterPwdValid=true;
			document.querySelector("#shelter_pwd").classList.add("is-valid");
		}
		
		
	}
	
	document.querySelector("#shelter_pwd").addEventListener("input",checkShelterPwd);
	document.querySelector("#shelter_pwd2").addEventListener("input",checkShelterPwd);
	
	
	let emails=document.querySelectorAll(".email")
	
	for(let i=0; i<emails.length; i++){
		emails[i].addEventListener("input",function(){
			this.classList.remove("is-invalid");
			this.classList.remove("is-valid");

			const inputEmail=this.value;
			const reg_email=/@/;
			if(reg_email.test(inputEmail)){
				isEmailValid=true;
				this.classList.add("is-valid");
			}else{
				isEmailValid=false;
				this.classList.add("is-invalid");
			}
		});
	}
	
	document.querySelector("#serialNum").addEventListener("input",function(){
		this.classList.remove("is-invalid");
		this.classList.remove("is-valid");
		
		let inputNum=this.value;
		const reg_id=/^[0-9]+\-[0-9]+\-[0-9]+$/;
		if(!reg_id.test(inputNum)){
			isIdValid=false; 
			this.classList.add("is-invalid");
			return; 
		}
		
		const self=this;
		
		//중복확인
		ajaxPromise("${pageContext.request.contextPath}/users/checkSerialNum.do","get","inputNum="+inputNum)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			console.log(data);
			
			if(data.isExist){
				isIdValid=false;
				self.classList.add("is-invalid");
			}else{
				isIdValid=true;
				self.classList.add("is-valid");
			}
		});
	});
</script>
</body>
</html>
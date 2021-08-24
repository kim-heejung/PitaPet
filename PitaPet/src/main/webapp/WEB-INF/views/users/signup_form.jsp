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
	margin-left:-60px;
}
* {
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
     
      <div id="tab1" data-tab-content class="items active">
        <h2>일반회원 회원가입 폼</h2>
        	<form action="${pageContext.request.contextPath}/users/signup.do" method="post" id="myForm">
				<div>
					<label class="control-label" for="id_petusers">아이디</label>
					<input class="form-control" type="text" name="id_petusers" id="id_petusers"/>
					<small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요.</small>
					<div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>
				</div>
				<div>
					<label class="control-label" for="pwd_petusers">비밀번호</label>
					<input class="form-control" type="password" name="pwd_petusers" id="pwd_petusers"/>
					<small class="form-text text-muted">5글자~10글자 이내로 입력하세요.</small>
					<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
				</div>
				<div>
					<label class="control-label" for="pwd_petusers2">비밀번호 확인</label>
					<input class="form-control" type="password" name="pwd_petuser2" id="pwd_petusers2"/>
				</div>
				<br />
				<div>
					<label class="control-label" for="phoneNumber_petusers">연락처</label>		
					<input class="" type="tel" name="phoneNumber_petusers1" id="phoneNumber_petusers1"/>-
					<input class="" type="tel" name="phoneNumber_petusers2" id="phoneNumber_petusers2" />-
					<input class="" type="tel" name="phoneNumber_petusers3" id="phoneNumber_petusers3" />
				</div>
				<br />
				<div>
					<label for="birth">생년월일</label>
					<input type="date" name="birth" value="2021-08-20" />
				</div>
				<br />
				<div>
					<label class="control-label" for="email_petusers">이메일</label>
					<input class="form-control" type="text" name="email_petusers" id="email_petusers"/>
					<div class="invalid-feedback">이메일 형식을 확인 하세요.</div>
				</div>
				<div>
					<label class="control-label" for="address_petusers">주소</label>
					<input class="form-control" type="address" name="address_petusers" id="address_petusers" />
				</div>
				<br />
				<div>
					<label class="control-label" for="household">가구원</label>
					<select name="household" id="household">
						<option value="one">1명</option>
						<option value="two">2명</option>
						<option value="three">3명이상</option>
					</select>
				</div>
				<!-- <input type="hidden" name="groupNum" value="0" />-->
				 <button class="btn btn-primary" type="submit">가입</button>
			</form>
      </div>
      
      <div id="tab2" data-tab-content class="items">
		<h2>보호소회원 회원가입 폼</h2>
		<form action="${pageContext.request.contextPath}/users/signup.do" method="post" id="myForm2">
			<div>
				<label class="control-label" for="id_shelter">아이디</label>
				<input class="form-control" type="text" name="id_shelter" id="id_shelter"/>
				<small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요.</small>
				<div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>
			</div>
			<div>
				<label class="control-label" for="pwd_shelter">비밀번호</label>
				<input class="form-control" type="password" name="pwd_shelter" id="pwd_shelter"/>
				<small class="form-text text-muted">5글자~10글자 이내로 입력하세요.</small>
				<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
			</div>
			<div>
				<label class="control-label" for="pwd_shelter2">비밀번호 확인</label>
				<input class="form-control" type="password" name="pwd_shelter2" id="pwd_shelter2"/>
			</div>
			<div>
				<label class="control-label" for="name_shelter">보호소 이름</label>
				<input class="form-control" type="text" name="name_shelter" id="name_shelter"/>
			</div>
			<div>
				<label class="control-label" for="serialnum">고유번호</label>
				<input class="form-control" type="num" name="serialnum" id="serialnum"/>
			</div>
			<div>
				<label class="control-label" for="address_shelter">보호소 위치</label>
				<input class="form-control" type="address" name="address_shelter" id="address_shelter" />
			</div>
			<br />
			<div>
				<label class="control-label" for="phoneNumber_shelter">연락처</label>
				<input class="" type="tel" name="phoneNumber_shelter1" id="phoneNumber_shelter1"/>-
				<input class="" type="tel" name="phoneNumber_shelter2" id="phoneNumber_shelter2" />-
				<input class="" type="tel" name="phoneNumber_shelter3" id="phoneNumber_shelter3" />
			</div>
			<br />
			<div>
				<label class="control-label" for="email_shelter">이메일</label>
				<input class="form-control" type="text" name="email_shelter" id="email_shelter"/>
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
</script>

<script>

//폼에 submit 이벤트가 발생했을때 실행할 함수 등록
document.querySelector("#myForm").addEventListener("submit", function(e){
	//폼 전체의 유효성 여부 알아내기 
	let isFormValid = isIdValid && isPwdValid && isEmailValid;
	if(!isFormValid){//폼이 유효하지 않으면
		//폼 전송 막기 
		e.preventDefault();
	}	
});
	
document.querySelector("#myForm2").addEventListener("submit", function(e){
	//폼 전체의 유효성 여부 알아내기 
	let isFormValid2 = isIdValid2 && isPwdValid2 && isEmailValid2;
	if(!isFormValid2){//폼이 유효하지 않으면
		//폼 전송 막기 
		e.preventDefault();
	}	
});
	

</script>
</body>
</html>
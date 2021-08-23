<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/signup_form.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
   <h1>회원가입하기</h1>
   <div id="petusers">
      <h2>일반 회원가입</h2>
      <form action="${pageContext.request.contextPath}/users/signup.do" method="post" id="myForm">	
         <div>
            <label class="control-label" for="id">아이디</label>
            <input class="form-control" type="text" name="id" id="id"/>
         </div>
         <div>
            <label class="control-label" for="pwd">비밀번호</label>
            <input class="form-control" type="password" name="pwd" id="pwd"/>
         </div>
         <div>
            <label class="control-label" for="pwd2">비밀번호 확인</label>
            <input class="form-control" type="password" name="pwd2" id="pwd2"/>
         </div>
		<div>
            <label class="control-label" for="name">이름</label>
            <input class="form-control" type="text" name="name" id="name"/>
         </div>
         <div>
            <label class="control-label" for="phoneNumber">연락처</label>      
            <input class="form-control" type="tel" name="phoneNumber" id="phoneNumber"/>
         </div>
         <div>
            <label for="birth">생년월일</label>
            <input type="date" name="birth"/>
         </div>
         <div>
            <label class="control-label" for="email">이메일</label>
            <input class="form-control" type="text" name="email" id="email"/>
            <div class="invalid-feedback">이메일 형식을 확인 하세요.</div>
         </div>
         <div>
            <label class="control-label" for="address">주소</label>
            <input type="text" class="form-control" name="address" id="address" />
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
         <input type="hidden" name="groupNum" value="0"/>
         
         <button type="submit"> 회원 가입 하기 </button>
      </form>
   </div>
	<div id="shelter">
      <h2>기관 회원가입</h2>
      <form action="${pageContext.request.contextPath}/users/signup.do" method="post" id="shelterForm">
      	<input type="hidden" name="groupNum" value="1"/>
      <div>
         <label class="control-label" for="id">아이디</label>
         <input class="form-control" type="text" name="id" id="id"/>
         <small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요.</small>
         <div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>
      </div>
      <div>
         <label class="control-label" for="pwd">비밀번호</label>
         <input class="form-control" type="password" name="pwd" id="pwd"/>
         <small class="form-text text-muted">5글자~10글자 이내로 입력하세요.</small>
         <div class="invalid-feedback">비밀번호를 확인 하세요.</div>
      </div>
      <div>
         <label class="control-label" for="pwd2">비밀번호 확인</label>
         <input class="form-control" type="password" name="pwd2" id="pwd2"/>
      </div>
      <div>
         <label class="control-label" for="name">보호소 이름</label>
         <input class="form-control" type="text" name="name" id="name"/>
      </div>
      <div>
         <label class="control-label" for="serialnum">고유번호</label>
         <input class="form-control" name="serialnum" id="serialnum"/>
      </div>
      <div>
         <label class="control-label" for="address">보호소 위치</label>
         <input class="form-control" name="address" id="address" />
      </div>
      <div>
         <label class="control-label" for="phoneNumber">연락처</label>      
         <input class="form-control" type="tel" name="phoneNumber1" id="phoneNumber"/>
      </div>
      <div>
         <label class="control-label" for="email">이메일</label>
         <input class="form-control" type="text" name="email" id="email"/>
         <div class="invalid-feedback">이메일 형식을 확인 하세요.</div>
      </div>
      <button type="submit"> 회원 가입 하기 </button>
      </form>
   </div>
   <button class="btn btn-primary changeBtn" id="general">일반 회원 가입하기</button>
   <button class="btn btn-primary changeBtn" id="shelter">보호소 회원 가입하기</button>
</div>
</body>
</html>
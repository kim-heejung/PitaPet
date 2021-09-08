<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/users/info.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<style>
body{
  background-color:#31394D;
}
.color-card{
  background:#31394D;
}

.color-card-2{
  background:#FDFEFF;
}
.title{
  color:#31394D;
  font-family: roboto;
  weight:300;
}
.title-2{
  color:#2D354A;
  font-family: roboto;
  weight:300;
}
.followers{
  color:#666B7D;
  font-family:10px;
  margin-top:10px;
  font-family: roboto;
  weight:100;
}

.job-title{
  color:#7C8097;
  font-size:12px;
  weight:100;
  font-family:roboto;
}

.desc{
  font-size:12px;
  color:#B7B8C0;
}


ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}
.desc {
	width: 90%;
	margin:10px auto;
	display:flex;
}
.job-title, .p-content{
	flex:1;
	width: 45%;
}
.i-l{
  float:left;
  margin-left:16px;
  margin-top:16px;
}
.i-r{
  float:right;
  margin-right:16px;
  margin-top:16px;
}
.w{
   color:#ffffff;
}
.b{
   color:#2F3B4B;
}
hr{
  border-color:#7C8097;
  width:90%;
  margin-top:24px;
  margin-bottom:24px;
}

.hr-2{
  border-color:#E4E8ED;
}


.content{
  display:center;
}

*{
  font-family:Roboto;
  -webkit-box-sizing: border-box; 
  -moz-box-sizing: border-box; 
  box-sizing: border-box;
}
.top{
  margin-top:16px;
}
.color-a{
  background: linear-gradient(to top right, #8162CE, #F54BA5);
}

.color-b{
  background: linear-gradient(to bottom right, #C90A6D, #FF48A0);
}

.color-c{
  background: linear-gradient(to bottom right, #5E5AEC, #3F9EFC);
}
.color-d{
  background: linear-gradient(to bottom right, #6452E9, #639FF9);
}
.id_left{
  color:#ffffff;
}
.btn{
  border:none;
  height:40px;
  color:#ffffff;
  width:35%;
  font-size:15px;
  border-radius:30px;
  box-shadow: 0 13px 26px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.16);
}
.btn:hover{
  border:solid 1px #DA59B1;
  height:40px;
  font-family: Roboto;
  color: #DA59B1;
  background:#ffffff;
  width:35%;
  border-color: linear-gradient(to top right, #8162CE, #F54BA5);;
  border-radius:30px;
  box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.16);
}

.circule{
  border-radius:50%;
  border:none;
  height:60px;
  width:60px;
  color:#ffffff;
  box-shadow: 0 13px 26px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.16);
  
  }2

.up{
  margin-top:40px;
}

.img{
  width:280px;
}
.container {
	width: 960px;
	margin: 0 auto;
	padding: 0px;
	position: relative;
}

.container:after, .container:before {
	content: " ";
	display: table;
}

.container:after {
	clear: both;
}

.grid-1, .grid-2, .grid-3, .grid-4, .grid-5, .grid-6, .grid-7, .grid-07,  .grid-8, .grid-9, .grid-10, .grid-11, .grid-12, .grid-13, .grid-14, .grid-15, .grid-16, .grid-1-3 {
	float: left ;
	margin-left: 10px;
	margin-right: 10px;
}

.grid-1 	{width: 40px;}
.grid-2 	{width: 100px;}
.grid-3 	{width: 160px;}
.grid-4 	{width: 220px;}
.grid-5 	{width: 280px;}
.grid-6 	{width: 340px;}
.grid-07  {width:375px;}
.grid-7 	{
	width: 400px;
	margin-top:30px;
}
.grid-8 	{width: 460px;}
.grid-9 	{width: 520px;}
.grid-10 	{width: 580px;}
.grid-11 	{width: 640px;}
.grid-12 	{width: 700px;}
.grid-13 	{width: 760px;}
.grid-14 	{width: 820px;}
.grid-15 	{width: 880px;}
.grid-16 	{width: 940px;}
.grid-1-3	{width: 300px;}



/*cards*/
body {
  background: #e2e1e0;
  text-align: center;
}

.card {
  border-radius: 6px;
  display: inline-block;
  height: 667px;
  margin: 1rem;
  position: relative;
  width: 375px;
  box-shadow: 0 12px 13px rgba(0,0,0,0.16), 0 12px 13px rgba(0,0,0,0.16);
  transition: all 0.3s cubic-bezier(.25,.8,.25,1);
}

.card-1 {
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  transition: all 0.3s cubic-bezier(.25,.8,.25,1);
}

.card-1:hover {
  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
}

.card-2 {
  box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
}

.card-3 {
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
}

.card-4 {
  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
}

.card-5 {
  box-shadow: 0 19px 38px rgba(0,0,0,0.15), 0 15px 12px rgba(0,0,0,0.15);
}

.card-6{
  -webkit-box-shadow: 10px 10px 44px 15px rgba(0,0,0,0.14);
-moz-box-shadow: 10px 10px 44px 15px rgba(0,0,0,0.14);
box-shadow: 10px 10px 44px 15px rgba(0,0,0,0.14);
}




.card-elevation{
 /*sombra*/
   -moz-box-shadow:7px 7px 5px 0px rgba(50, 50, 50, 0.25);
   -webkit-box-shadow:7px 7px 5px 0px rgba(50, 50, 50, 0.25);
   box-shadow: 7px 7px 5px 0px rgba(50, 50, 50, 0.25);;
}



.header{
  background: linear-gradient(to bottom right, #F762D2, #FF51A0);
  height:250px;
}


.profile{
  border-radius:100%;
  margin-top:30px;
  width:85px;
  height:85px;
}

.center{
    display: block;
    margin-left: auto;
    margin-right: auto
}

.btn-pwd-right{
	color:#31394D;
}

.element-animation{
  animation: animationFrames ease 2s;
  animation-iteration-count: 2;
  transform-origin: 50% 50%;
  animation-fill-mode:forwards; /*when the spec is finished*/
  -webkit-animation: animationFrames ease 1.5s;
  -webkit-animation-iteration-count: 1;
  -webkit-transform-origin: 50% 50%;
  -webkit-animation-fill-mode:forwards; /*Chrome 16+, Safari 4+*/ 
}


@keyframes animationFrames{
  0% {
    opacity:0;
    transform:  translate(-1500px,0px)  ;
  }
  60% {
    opacity:1;
    transform:  translate(30px,0px)  ;
  }
  80% {
    transform:  translate(-10px,0px)  ;
  }
  100% {
    opacity:1;
    transform:  translate(0px,0px)  ;
  }
}

@-webkit-keyframes animationFrames {
  0% {
    opacity:0;
    -webkit-transform:  translate(-1500px,0px)  ;
  }
  60% {
    opacity:1;
    -webkit-transform:  translate(30px,0px)  ;
  }
  80% {
    -webkit-transform:  translate(-10px,0px)  ;
  }
  100% {
    opacity:1;
    -webkit-transform:  translate(0px,0px)  ;
  }



  
   
</style>
</head>
<body>
<div id="info">
	<div class="container">
		<div class="grid-7 element-animation" v-if="${dto.groupNum eq 0}">
			<h1 class="title">일반 회원 정보</h1>
			<div class="card color-card">
				 <div v-if="${empty dto.profile}">
				 	<svg style="color:#fff" id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="profile bi bi-person-circle" viewBox="0 0 16 16">
					  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
					</svg>
				 </div>
		 		 <div v-else>
		 			<img id="profileImage" src="${pageContext.request.contextPath}${dto.profile}" alt="" />
		 	     </div>
		 	     
			 	<h1 class="id id_left">${id }</h1>
			 	
			 	<div class="desc top">
			 		<p class="job-title"> 비밀번호</p>
       				<a class="p-content btn-pwd-left" :href="pwd_updateform">수정하기</a>
     			</div>
     			
     			
			 	<div class="desc top">
			 		<p class="job-title"> 이름</p>
       				<p class="p-content">${dto.name }</p>
     			</div>
     			
     			
			 	<div class="desc top">
			 		<p class="job-title"> 폰번호</p>
       				<p class="p-content">${dto.phoneNumber }</p>
     			</div>
     			
     			
			 	<div class="desc top">
			 		<p class="job-title"> 주소</p>
       				<p class="p-content">${dto.address }</p>
     			</div>
     			
     			
			 	<div class="desc top">
			 		<p class="job-title"> 가구수</p>
       				<p class="p-content">${dto.household }</p>
     			</div>
     			
     			
			 	<div class="desc top">
			 		<p class="job-title"> 이메일</p>
       				<p class="p-content">${dto.email }</p>
     			</div>
     			
     			
			 	<div class="desc top">
			 		<p class="job-title"> 가입일</p>
       				<p class="p-content">${dto.regdate }</p>
     			</div>
     			
 			<button class="btn color-a top"><a :href="updateform">개인 정보 수정</a></button>
   			<button class="btn color-a top"><a href="javascript:deleteConfirm()">탈퇴</a></button>
     			
     		</div>		
		</div>
		
		<div class="grid-7 element-animation">
			 <h1 class="title-2">보호소 회원 정보</h1>
			 <div class="card color-card-2">
				 <div v-if="${empty dto.profile}">
				 	<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="profile bi bi-person-circle" viewBox="0 0 16 16">
					  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
					</svg>
				 </div>
		 		 <div v-else>
		 			<img id="profileImage" src="${pageContext.request.contextPath}${dto.profile}" alt="" />
		 	     </div>
		 	     
			 	<h1 class="id">${id }</h1>
			 	
			 	<div class="desc top">
			 		<p class="job-title"> 비밀번호</p>
       				<a class="p-content btn-pwd-right" :href="pwd_updateform">수정하기</a>
     			</div>
     			
     			<div class="desc top">
			 		<p class="job-title"> 고유번호</p>
       				<p class="p-content">${sDto.serialNum}</p>
     			</div>
     			
			 	<div class="desc top">
			 		<p class="job-title"> 보호소 이름</p>
       				<p class="p-content">${sDto.name }</p>
     			</div>
     			
			 	<div class="desc top">
			 		<p class="job-title"> 폰번호</p>
       				<p class="p-content">${sDto.phoneNumber }</p>
     			</div>
     			
     			
			 	<div class="desc top">
			 		<p class="job-title"> 주소</p>
       				<p class="p-content">${sDto.address }</p>
     			</div>
     			
			 	<div class="desc top">
			 		<p class="job-title"> 이메일</p>
       				<p class="p-content">${dto.email }</p>
     			</div>
     			
			 	<div class="desc top">
			 		<p class="job-title"> 가입일</p>
       				<p class="p-content">${dto.regdate }</p>
     			</div>
     			
 			<button class="btn color-a top"><a :href="updateform">개인 정보 수정</a></button>
   			<button class="btn color-a top"><a href="javascript:deleteConfirm()">탈퇴</a></button>
     			
     		</div>		
		</div>
		
	</div>
</div>	


<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	//탈퇴확인
	function deleteConfirm(){
		const isDelete=confirm("${id} 님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath}/users/delete.do";
		}
	}
	
	let info =new Vue({
		el:"#info",
		data(){
			return{
				updateform:"${pageContext.request.contextPath}/users/updateform.do",
				pwd_updateform:"${pageContext.request.contextPath}/users/pwd_updateform.do"
			}
		}
	});
	
</script>
</body>
</html>





<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
   /* 프로필 이미지를 작은 원형으로 만든다 */
   #profileImage{
      width: 50px;
      height: 50px;
      border: 1px solid #cecece;
      border-radius: 50%;
      margin-left:180px;
   }
   #imageForm{
   	  display:none;
   }
   #updateform{
 	 background-image: linear-gradient(90deg, rgb(106, 33, 223), rgb(209, 51, 230));
	}
	.container {
	  vertical-align: middle;
	  text-align: center;
	}
	.content {
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
	button.btn.btn-primary{
		margin:30px;
	}
	div.tab.btn.btn-primary {
	height: 40px;
	}
	.btn {
	  border: none;
	  font-weight: bold;
	  width: 22.5rem;
	  background-image: linear-gradient(90deg, rgb(209, 51, 230), rgb(106, 33, 223), rgb(9, 204, 204));
	  border-radius: 2rem;
	  height: 2.5rem;
	  color: whitesmoke;
	}
	.form-title {
  		margin-bottom:15px;
  		text-align: center;
  		font-weight: bold;
	}
	.addr-btn{
		margin:30px;
	}
</style>

</head>
<body>
<div id="updateform">
	<jsp:include page="/resources/header.jsp"></jsp:include>
	<slider-component :cpath="cpath"></slider-component>
	<intro-component></intro-component>
	<review-component></review-component>
	<family-component></family-component>
	<footer-component></footer-component>
	<div class="container">
		<c:choose>
			<c:when test="${dto.groupNum eq 0}">
				<form class="content" action="${pageContext.request.contextPath}/users/update.do" method="post">
					<h1 class="form-title">일반 회원 정보 수정</h1>
						<div>
							<a id="profileLink" href="javascript:">
								<c:choose>
									<c:when test="${empty dto.profile }">
										<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
										  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
										  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
										</svg>
									</c:when>
									<c:otherwise>
										<img id="profileImage" src="${pageContext.request.contextPath}${dto.profile}" alt="" />
									</c:otherwise>
								</c:choose>
							</a>
						</div>
						
						<div>
							<input type="hidden" name="profile" value="${empty dto.profile? '': 'dto.profile'}"/>
						</div>
						
						<div>
							<input type="hidden" name="groupNum" value="0" />
						</div>
						<br />
						<div>
							<label class="control-label" for="id">아이디</label>
							<input class="form-control" type="text" id="id" value="${id }" disabled/>
						</div>
						<br />
						<div>
							<label class="control-label" for="email">이메일</label>
							<input class="form-control" type="text" id="email" value="${dto.email }" name="email"/>
						</div>
						<br />
						<div>
							<label class="control-label" for="phoneNumber">폰번호</label>
							<input class="form-control" type="text" id="phoneNumber" value="${dto.phoneNumber }" name="phoneNumber"/>
						</div>
						<br />
						<div>
							<label class="control-label" for="address">주소</label>
							<input class="form-control" type="text" id="address_users" value="${dto.address }" name="address"/>
							<a class="addr-btn btn btn-primary btn-sm" href="javascript:openAddrPop('${pageContext.request.contextPath}/users/addr.do', 'popup');">주소 검색</a>
						</div>
						
						<div>
						<label class="control-label" for="household">가구원</label>
						<select class="form-select" name="household" id="household">
							<option value="one" ${dto.household eq "one" ? "selected" : "" }>1명</option>
							<option value="two" ${dto.household eq "two" ? "selected" : "" }>2명</option>
							<option value="three" ${dto.household eq "three" ? "selected" : "" }>3명이상</option>
						</select>
					</div>
						<button class="btn btn-primary" type="submit">수정 반영</button>
				</form>
				<form action="${pageContext.request.contextPath}/users/ajax_profile_upload.do" method="post" id="imageForm" enctype="multipart/form-data">
					<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
				</form>
			</c:when>
			
			
			<c:otherwise>
				<form class="content"action="${pageContext.request.contextPath}/users/update.do" method="post">
					<h1>보호소 회원 정보 수정</h1>
						<a id="profileLink" href="javascript:">
							<c:choose>
								<c:when test="${empty dto.profile }">
									<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
									  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
									  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
									</svg>
								</c:when>
								<c:otherwise>
									<img id="profileImage" src="${pageContext.request.contextPath}${dto.profile}" alt="" />
								</c:otherwise>
							</c:choose>
						</a>
						<input type="hidden" name="profile" value="${empty dto.profile? '': 'dto.profile'}"/>
						<input type="hidden" name="groupNum" value="1" />
						<div>
							<label class="control-label" for="id">아이디</label>
							<input class="form-control" type="text" id="id" value="${id }" disabled/>
						</div>
						<br />
						<div>
							<label class="control-label" for="name">보호소 이름</label>
							<input class="form-control" type="text" id="id" value="${dto.name }" name="name" disabled/>
						</div>
						<br />
						<div>
							<label class="control-label" for="email">이메일</label>
							<input class="form-control" type="text" id="email" value="${dto.email }" name="email"/>
						</div>
						<br />
						<div>
							<label class="control-label" for="phoneNumber">폰번호</label>
							<input class="form-control" type="text" id="phoneNumber" value="${dto.phoneNumber }" name="phoneNumber"/>
						</div>
						<br />
						<div>
							<label class="control-label" for="address">주소</label>
							<input class="form-control" type="text" id="address_shelter" value="${dto.address }" name="address"/>
							<a class="addr-btn btn btn-primary btn-sm" href="javascript:openAddrPop('${pageContext.request.contextPath}/users/addr.do', 'popup');">주소 검색</a>
						</div>
						<div>
					</div>
						<button class="btn btn-primary" type="submit">수정 반영</button>
				</form>
				
				<form action="${pageContext.request.contextPath}/users/ajax_profile_upload.do" method="post" id="imageForm" enctype="multipart/form-data">
					<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	//주소 팝업
	function openAddrPop(url, name){
	    let options = 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no, scrollbars=yes';
	    window.open(url, name, options);
	}
	
	function jusoCallBack(roadFullAddr,entX,entY){
		console.log(roadFullAddr,entX,entY);
		if(${dto.groupNum eq 0}){
			document.querySelector("#address_users").value = roadFullAddr;
		}else{
			document.querySelector("#address_shelter").value = roadFullAddr;
		}
	}

	//프로필 이미지 javascript
	document.querySelector("#profileLink").addEventListener("click", function(){
		// input type="file" 을 강제 클릭 시킨다. 
		document.querySelector("#image").click();
	});
	//이미지를 선택했을때 실행할 함수 등록 
	document.querySelector("#image").addEventListener("change", function(){
		
		let form=document.querySelector("#imageForm");
		
		// gura_util.js 에 정의된 함수를 호출하면서 ajax 전송할 폼의 참조값을 전달하면 된다. 
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			// data 는 {imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
			console.log(data);
			let img=`<img id="profileImage" src="${pageContext.request.contextPath}\${data.imagePath}"/>`;
			document.querySelector("#profileLink").innerHTML=img;
			// input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
			document.querySelector("input[name=profile]").value=data.imagePath;
		});
	});
	
	new Vue({
	      el: "#updateform",
	      data() {
	    	  return{
	    		 	 
	    	  }
	      }
	   });
</script>
</body>
</html>
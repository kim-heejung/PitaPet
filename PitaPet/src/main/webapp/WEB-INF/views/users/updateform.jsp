<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/updateform.jsp</title>
<style>
   /* 프로필 이미지를 작은 원형으로 만든다 */
   #profileImage{
      width: 50px;
      height: 50px;
      border: 1px solid #cecece;
      border-radius: 50%;
   }
   #imageForm{
   	  display:none;
   }
</style>

</head>
<body>
<div id="updateform">
	<div class="container">
		<c:choose>
			<c:when test="${dto.groupNum eq 0}">
				<h1>가입 정보 수정 폼입니다</h1>
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
				<form action="${pageContext.request.contextPath}/users/update.do" method="post">
					
					<input type="hidden" name="profile" value="${empty dto.profile? '': 'dto.profile'}"/>
					<input type="hidden" name="groupNum" value="0" />
					<div>
						<label for="id">아이디</label>
						<input type="text" id="id" value="${id }" disabled/>
					</div>
					<div>
						<label for="email">이메일</label>
						<input type="text" id="email" value="${dto.email }" name="email"/>
					</div>
					<div>
						<label for="phoneNumber">폰번호</label>
						<input type="text" id="phoneNumber" value="${dto.phoneNumber }" name="phoneNumber"/>
					</div>
					<div>
						<label for="address">주소</label>
						<input type="text" id="address" value="${dto.address }" name="address"/>
					</div>
					<div>
					<label class="control-label" for="household">가구원</label>
					<select name="household" id="household">
						<option value="one" ${dto.household eq "one" ? "selected" : "" }>1명</option>
						<option value="two" ${dto.household eq "two" ? "selected" : "" }>2명</option>
						<option value="three" ${dto.household eq "three" ? "selected" : "" }>3명이상</option>
					</select>
				</div>
					<button type="submit">수정 반영</button>
				</form>
				<form action="${pageContext.request.contextPath}/users/ajax_profile_upload.do" method="post" id="imageForm" enctype="multipart/form-data">
					<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
				</form>
			</c:when>
			<c:otherwise>
				<h1>(보호소회원)가입 정보 수정 폼입니다</h1>
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
				<form action="${pageContext.request.contextPath}/users/update.do" method="post">
					
					<input type="hidden" name="profile" value="${empty dto.profile? '': 'dto.profile'}"/>
					<input type="hidden" name="groupNum" value="0" />
					<div>
						<label for="id">아이디</label>
						<input type="text" id="id" value="${id }" disabled/>
					</div>
					<div>
						<label for="name">보호소 이름</label>
						<input type="text" id="id" value="${sDto.name }" disabled/>
					</div>
					<div>
						<label for="email">이메일</label>
						<input type="text" id="email" value="${dto.email }" name="email"/>
					</div>
					<div>
						<label for="phoneNumber">폰번호</label>
						<input type="text" id="phoneNumber" value="${dto.phoneNumber }" name="phoneNumber"/>
					</div>
					<div>
						<label for="address">주소</label>
						<input type="text" id="address" value="${dto.address }" name="address"/>
					</div>
					<div>
				</div>
					<button type="submit">수정 반영</button>
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
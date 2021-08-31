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
   #profileImage{
      width: 50px;
      height: 50px;
      border: 1px solid #cecece;
      border-radius: 50%;
   }
</style>
</head>
<body>
<div id="info">
	<div class="container">
		<c:choose>
			<c:when test="${dto.groupNum eq 0}">
				<h1>회원 정보</h1>
			   <table>
			      <tr>
			         <th>아이디</th>
			         <td>${id }</td>
			      </tr>
			      <tr>
			         <th>프로필 이미지</th>
			         <td>
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
					</td>
			      </tr>
			      <tr>
			         <th>비밀번호</th>
			         <td><a class="btn btn-sm btn-outline-success" :href="pwd_updateform">수정하기</a></td>
			      </tr>
			      <tr>
			      	<th>이름</th>
			      	<td>${dto.name }</td>
			      </tr>
			      <tr>
			      	<th>폰번호</th>
			      	<td>${dto.phoneNumber }</td>
			      </tr>
			      <tr>
			      	<th>주소</th>
			      	<td>${dto.address }</td>
			      </tr>
			      <tr>
			      	<th>가구수</th>
			      	<td>${dto.household }</td>
			      </tr>
			      <tr>
			         <th>이메일</th>
			         <td>${dto.email }</td>
			      </tr>
			      <tr>
			         <th>가입일</th>
			         <td>${dto.regdate }</td>
			      </tr>
			   </table>
			</c:when>
			<c:otherwise>
				<h1>보호소 회원 정보</h1>
			   <table>
			      <tr>
			         <th>아이디</th>
			         <td>${id }</td>
			      </tr>
			      <tr>
			         <th>프로필 이미지</th>
			         <td>
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
					</td>
			      </tr>
			      <tr>
			         <th>비밀번호</th>
			         <td><a class="btn btn-sm btn-outline-success" href="${pageContext.request.contextPath}/users/pwd_updateform.do">수정하기</a></td>
			      </tr>
			      <tr>
			      	<th>고유번호</th>
			      	<td>${sDto.serialNum }</td>
			      </tr>
			      <tr>
			      	<th>보호소 이름</th>
			      	<td>${sDto.name }</td>
			      </tr>
			      <tr>
			      	<th>폰번호</th>
			      	<td>${sDto.phoneNumber }</td>
			      </tr>
			      <tr>
			      	<th>주소</th>
			      	<td>${sDto.address }</td>
			      </tr>
			      <tr>
			         <th>이메일</th>
			         <td>${dto.email }</td>
			      </tr>
			      <tr>
			         <th>가입일</th>
			         <td>${dto.regdate }</td>
			      </tr>
			   </table>
			
			</c:otherwise>
		</c:choose>
	   
	   <a class="btn btn-primary" :href="updateform">개인 정보 수정</a>
	   <a class="btn btn-danger" href="javascript:deleteConfirm()">탈퇴</a>
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





<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<%-- bootstrap --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
</head>
<body>
<div class="container">
   <div class="card mb-3">
      <div class="card-body">
      	 <p class="card-text">${dto.name}</p>
      	 <p class="card-text">${dto.title}</p>
      	 <p class="card-text">${dto.viewCount}</p>
         <p><small>${dto.regdate}</small></p>
         <p class="card-text">by <strong>${dto.writer}</strong></p>
         <img class="card-img-top" src="${pageContext.request.contextPath}${dto.imagePath}"/>
         <p class="card-text">${dto.breed}</p>
         <p class="card-text">${dto.petName}</p>
         <p class="card-text">${dto.petAge}</p>
         <p class="card-text">${dto.petGender}</p>
         <p class="card-text">${dto.vaccination}</p>
         <p class="card-text">${dto.neutralization}</p>
         <p class="card-text">${dto.findDate}</p>
         <p class="card-text">${dto.caption}</p> 
         <c:choose>
         	<c:when test="${empty idCheck }">
         		<p style="color:red;">♡</p>	
         	</c:when>
         	<c:otherwise>
         		<c:choose>
         			<c:when test="${like.liked eq 'yes' }">
         				<p><a style="color:red;" href="${pageContext.request.contextPath}/api/adoptlike/unlike.do?num=${dto.num }">♥</a></p>
         			</c:when>
         			<c:otherwise>
         				<p><a style="color:red;" href="${pageContext.request.contextPath}/adoptlike/like.do?num=${dto.num }">♡</a></p>
         			</c:otherwise>
         		</c:choose>
         	</c:otherwise>
         </c:choose>
   		 <span style="color:red;">${count }</span>
      </div>
   </div>
   <nav>
      <ul class="breadcrumb">
         <li class="breadcrumb-item">
            <a href="">목록보기</a>
         </li>
         <c:if test="${dto.writer eq id }">
	         <li><a href="${pageContext.request.contextPath}/adopt/private/updateform.do?num=${dto.num }">수정</a></li>
	         <li><a href="${pageContext.request.contextPath}/api/adopt/delete.do?num=${dto.num }">삭제</a></li>
	     </c:if>
      </ul>
   </nav>
   <nav>
      <ul class="pagination justify-content-center">
         <c:choose>
         	<c:when test="${dto.prevNum ne 0 }">
         		<li class="page-item mr-3">
               		<a class="page-link" href="${pageContext.request.contextPath}/adopt/detail.do?num=${dto.prevNum}&shelterName=${dto.name}">&larr; Prev</a>
            	</li>
         	</c:when>
         	<c:otherwise>
         		<li class="page-item disabled mr-3">
               		<a class="page-link" href="javascript:">Prev</a>
            	</li>
         	</c:otherwise>
         </c:choose>
         <c:choose>
         	<c:when test="${dto.nextNum ne 0 }">
         		<li class="page-item">
               		<a class="page-link" href="${pageContext.request.contextPath}/adopt/detail.do?num=${dto.nextNum}&shelterName=${dto.name}">Next &rarr;</a>
            	</li>
         	</c:when>
         	<c:otherwise>
         		<li class="page-item disabled">
               		<a class="page-link" href="javascript:">Next</a>
            	</li>
         	</c:otherwise>
         </c:choose>         
      </ul>
   </nav> 
   
   <button><a href="${pageContext.request.contextPath}/reserve/private/insertform.do">상담 예약</a></button>     
</div>
</body>
</html>


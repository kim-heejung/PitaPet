<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/detail.jsp</title>
<%-- bootstrap --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
</head>
<body>
<div class="container">
   <nav>
      <ul class="breadcrumb">
         <li class="breadcrumb-item">
            <a href="">겔러리 목록</a>
         </li>
         <c:if test="${dto.writer eq id }">
	         <li><a href="${pageContext.request.contextPath}/adopt/updateform2.do?num=${dto.num }">수정</a></li>
	         <li><a href="${pageContext.request.contextPath}/api/adopt/delete.do?num=${dto.num }">삭제</a></li>
	     </c:if>
         <!--  
         <li class="breadcrumb-item active">상세보기</li>
         -->
      </ul>
   </nav>
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
         ${dto.prevNum} 
         ${dto.nextNum}
         ${dto.name}
      </div>
   </div>
   <nav>
      <ul class="pagination justify-content-center">
         <c:choose>
         	<c:when test="${dto.prevNum ne 0 }">
         		<li class="page-item mr-3">
               		<a class="page-link" href="${pageContext.request.contextPath}/adopt/detail.do?num=${dto.prevNum}&shelterName=${name}">&larr; Prev</a>
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
               		<a class="page-link" href="${pageContext.request.contextPath}/adopt/detail.do?num=${dto.nextNum}&shelterName=${name}">Next &rarr;</a>
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
</div>

<div class="container">
   	<a href="${pageContext.request.contextPath}/reserve/insertform.do?num=${dto.num}">사진 업로드 하러 가기</a><br/>
   	<h1>겔러리 목록 입니다.</h1>
   	<div class="row">
		<c:forEach var="tmp" items="${list }">
			<div class="col-6 col-md-4 col-lg-3">
         		<div class="card mb-3">
            		<a href="${pageContext.request.contextPath}/reserve/detail.do?num=${tmp.num}">
	               		${tmp.num}
            		</a>
            		<div class="card-body">
            			<p class="card-text">${tmp.title}</p>
               			<p class="card-text">${tmp.id}</p>
               			<p class="card-text">${tmp.viewCount}</p>
               			<p><small>${tmp.reservedDate}</small></p>
            		</div>
         		</div>
      		</div>
		</c:forEach>
   	</div>
   	<nav>
	<ul class="pagination justify-content-center">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li class="page-item">
               		<a class="page-link" href="${pageContext.request.contextPath}/adopt/list.do?pageNum=${startPageNum - 1}">Prev</a>
            	</li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled">
               		<a class="page-link" href="javascript:">Prev</a>
            	</li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="page-item active">
                  		<a class="page-link" href="${pageContext.request.contextPath}/adopt/list.do?pageNum=${i}">${i }</a>
               		</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
                  		<a class="page-link" href="${pageContext.request.contextPath}/adopt/list.do?pageNum=${i}">${i}</a>
               		</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<li class="page-item">
               		<a class="page-link" href="${pageContext.request.contextPath}/gallery/list.do?pageNum=${endPageNum + 1}">Next</a>
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
</div>
</body>
</html>


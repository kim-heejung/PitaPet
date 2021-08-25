<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/review/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<style>
   .img-wrapper{
      height: 550px;
      transition: transform 0.3s ease-out;
   }
   
   .img-wrapper:hover{
      transform: scale(1.05);
   }
   
   .card .card-text{
      display:block;
      white-space : nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
   }
   
   .img-wrapper img{
     width: 100%;
     height: 100%;
     object-fit: contain;   
   }
</style>
</head>
<body>
<div class="container">
      <a href="${pageContext.request.contextPath}/review/private/insertform.do">추가하기</a><br/>
      <h1>입양후기</h1>
      <div class="row">
      <c:forEach var="tmp" items="${list }">
         <div class="col-2 col-md-5 col-lg-4">
               <div class="card mb-3">
                  <a href="${pageContext.request.contextPath}/review/detail.do?num=${tmp.num}">
                        <div class="img-wrapper">
                           <img class="card-img-top" src="${pageContext.request.contextPath }${tmp.img}" />
                        </div>
                  </a>
                  <div class="card-body">
                        <p class="card-text">${tmp.title}</p>
                        <p class="card-text">by <strong>${tmp.writer}</strong></p>
                        <p><small>${tmp.regdate}</small></p>
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
                     <a class="page-link" href="${pageContext.request.contextPath}/review/list.do?pageNum=${startPageNum - 1}">Prev</a>
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
                        <a class="page-link" href="${pageContext.request.contextPath}/review/list.do?pageNum=${i}">${i }</a>
                     </li>
            </c:when>
            <c:otherwise>
               <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/review/list.do?pageNum=${i}">${i}</a>
                     </li>
            </c:otherwise>
         </c:choose>
      </c:forEach>
      <c:choose>
         <c:when test="${endPageNum lt totalPageCount }">
            <li class="page-item">
                     <a class="page-link" href="${pageContext.request.contextPath}/review/list.do?pageNum=${endPageNum + 1}">Next</a>
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
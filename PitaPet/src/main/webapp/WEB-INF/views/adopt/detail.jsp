<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<jsp:include page="/resources/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />
<style>
	.like-detail{
		color:red;
	}
	.like-detail-count{
		margin-left:-4px;
	}
	
	.detail_info p{
		display:inline-block;
		font-size:1.6rem;
	}
	.detail_info a:hover{
		color:red;
	}
</style>
</head>
<body>
	<div id="adoptUpdate">
		<header-component :cpath="cpath" :id="id"></header-component>
		<div class="board-wrap">
			<page-category :cpath="cpath" :index="0"></page-category>
			<div class="container">
				<div class="card mb-3">
					<div class="card-body">
						<p class="card-text detail_tit">${dto.title}</p>
						<div class="detail_info">
							<span>${dto.writer}</span>
							<span>${dto.name}</span>
							<span>
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16" class="bi bi-eye"><path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"></path> <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"></path></svg>
								${dto.viewCount}
							</span>
							<span>
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16" class="bi bi-clock"><path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"></path> <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"></path></svg>
								${dto.regdate}
							</span>
							<c:choose>
					         	<c:when test="${empty idCheck }">
					         		<p class="like-detail">♡</p>	
					         	</c:when>
					         	<c:otherwise>
					         		<c:choose>
					         			<c:when test="${like.liked eq 'yes' }">
					         				<p><a class="like-detail" href="${pageContext.request.contextPath}/adoptlike/unlike.do?num=${dto.num }">♥</a></p>
					         			</c:when>
					         			<c:otherwise>
					         				<p><a class="like-detail" href="${pageContext.request.contextPath}/adoptlike/like.do?num=${dto.num }">♡</a></p>
					         			</c:otherwise>
					         		</c:choose>
					         	</c:otherwise>
					         </c:choose>
					   		 <span class="like-detail like-detail-count">${count }</span>
						</div>
						
						<div class="detail_content">
							<div class="content">
							 	<img class="card-img-top" src="${pageContext.request.contextPath}${dto.imagePath}" />
								<p>품종 - ${dto.breed}</p>
								<p>이름 - ${dto.petName}</p>
								<p>나이 - ${dto.petAge}</p>
								<p>성별 - ${dto.petGender}</p>
								<p>예방접종 - ${dto.vaccination}</p>
								<p>중성화 - ${dto.neutralization}</p>
								<p>보호소들어온날 - ${dto.findDate}</p>
								<div style="margin-top:50px;">${dto.caption}</div>
							</div>
						</div>
					</div>
				</div>
				<div class="btn-wrap btn-center detail-bottom">
					<a class="btn btn-s btn-black" href="${pageContext.request.contextPath}/adopt/list.do" style="margin-right:20px;">목록보기</a>
					<c:if test="${dto.writer eq id }">
						<a class="btn btn-s btn-white" href="${pageContext.request.contextPath}/adopt/private/updateform.do?num=${dto.num }" style="margin-right:20px;">수정</a>
						<a class="btn btn-s btn-white" id="adoptDel" href="javascript:" style="margin-right:20px;">삭제</a>
					</c:if>
					<a href="${pageContext.request.contextPath}/reserve/private/insertform.do" class="btn btn-s btn-black">상담예약</a>
				</div>
				<ul class="pagination justify-content-center movePage-wrap">
					<c:choose>
						<c:when test="${dto.prevNum ne 0 }">
							<li class="page-item mr-3"><a class="page-link"
								href="${pageContext.request.contextPath}/adopt/detail.do?num=${dto.prevNum}&animalType=${animalType}">&larr;
									Prev</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled mr-3"><a class="page-link"
								href="javascript:">Prev</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${dto.nextNum ne 0 }">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/adopt/detail.do?num=${dto.nextNum}&animalType=${animalType}">Next
									&rarr;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link"
								href="javascript:">Next</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<footer-component></footer-component>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/page_category.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script>
  new Vue({
      el : "#adoptUpdate",
      data:{
			cpath: "${pageContext.request.contextPath}",
			id: "${sessionScope.id}"
		},
  });
  
  document.querySelector("#adoptDel").addEventListener("click", function(){
	  if(confirm("정말 삭제하시겠습니까?")){
		  location.href="${pageContext.request.contextPath}/adopt/delete.do?num=${dto.num }";
	  }
  });
</script>
</body>
</html>


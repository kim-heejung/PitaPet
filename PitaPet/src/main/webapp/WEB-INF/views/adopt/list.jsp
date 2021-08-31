<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<%-- bootstrap 읽어오기 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<style>
   /* card 이미지 부모요소의 높이 지정 */
   .img-wrapper{
      height: 250px;
      /* transform 을 적용할대 0.3s 동안 순차적으로 적용하기 */
      transition: transform 0.3s ease-out;
   }
   /* .img-wrapper 에 마우스가 hover 되었을때 적용할 css */
   .img-wrapper:hover{
      /* 원본 크기의 1.1 배로 확대 시키기*/
      transform: scale(1.05);
   }
   
   .card .card-text{
      /* 한줄만 text 가 나오고  한줄 넘는 길이에 대해서는 ... 처리 하는 css */
      display:block;
      white-space : nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
   }
   	.img-wrapper img{
	   	width: 100%;
	   	height: 100%;
	   	/* fill | contain | cover | scale-down | none(default) */
	   	/*	
	   		cover - 부모의 크기에 맞게 키운 후, 자른다. 비율은 일정하게 증가한다. 
	   		contain - 안잘린다. 대신 빈 공간이 남을 수 있다.
	   		fill - 부모의 크기에 딱 맞게, 비율 관계 없이 맞춘다.(이미지가 일그러질 수 있다.)
	   		scale-down - 가로, 세로 중에 큰 것을 부모의 크기에 맞춘 상태까지만 커지거나 작아지고, 비율은 일정하다.
	   	*/
		object-fit: contain;	
   	}
</style>
</head>
<body>
<div class="container">
   	<h1>입양하기 게시판</h1>
   	<a href="${pageContext.request.contextPath}/adopt/insertform.do">새글 작성</a><br/>
   	<form action="list.do" method="get">
   		<select name="shelterName" id="shelter" onchange="formChange(this.form)">
   			<option value="선택하기">선택하기</option>
   			<option value="서울" ${shelterName eq "서울" ? "selected" : ""}>서울</option>
   			<option value="인천" ${shelterName eq "인천" ? "selected" : ""}>인천</option>
		    <option value="부산" ${shelterName eq "부산" ? "selected" : ""}>부산</option>
		</select>
   	</form>
   	<div class="row">
   		<c:forEach var="tmp" items="${list }">
			<div class="col-6 col-md-4 col-lg-3">
         		<div class="card mb-3">
            		<a href="${pageContext.request.contextPath}/adopt/detail.do?num=${tmp.num}&shelterName=${shelterName}">
	               		<div class="img-wrapper">
	                  		<img class="card-img-top" src="${pageContext.request.contextPath }${tmp.imagePath}" />
	               		</div>
            		</a>
            		<p class="card-text">${tmp.name}</p>
            		<p class="card-text">${tmp.title}</p>
               		<p class="card-text">by <strong>${tmp.writer}</strong></p>
               		<p class="card-text">${tmp.viewCount}</p>
               		<p><small>${tmp.regdate}</small></p>
            		<p style="color:red;">
            			<c:choose>
				        	<c:when test="${empty idCheck }">
				         		<p style="color:red;">♡</p>	
				         	</c:when>
				         	<c:otherwise>
				         		<c:choose>
				         			<c:when test="${tmp.liked eq 'yes' }">
				         				<p><a style="color:red;" href="${pageContext.request.contextPath}/api/adoptlike/unlike.do?num=${dto.num }">♥</a></p>
				         			</c:when>
				         			<c:otherwise>
				         				<p><a style="color:red;" href="${pageContext.request.contextPath}/adoptlike/like.do?num=${dto.num }">♡</a></p>
				         			</c:otherwise>
				         		</c:choose>
				         	</c:otherwise>
				        </c:choose>
            			<c:choose>
            				<c:when test="${not empty likeCountList }">
            					<c:forEach var="like" items="${likeCountList }">
            						<c:if test="${like.num eq tmp.num }">
            							<span style="color:red;">${like.cnt}</span>
            						</c:if>
            					</c:forEach>
            				</c:when>
            				<c:otherwise>
            					<span style="color:red;">${tmp.cnt }</span>
            				</c:otherwise>
            			</c:choose>
            		</p>	
         		</div>
      		</div>
		</c:forEach>
   	</div>
	<nav>
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${startPageNum ne 1 }">
					<li class="page-item">
               			<a class="page-link" href="${pageContext.request.contextPath}/adopt/list.do?pageNum=${startPageNum - 1}&shelterName=${shelterName}">Prev</a>
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
                  			<a class="page-link" href="${pageContext.request.contextPath}/adopt/list.do?pageNum=${i}&shelterName=${shelterName}">${i }</a>
               			</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
                  			<a class="page-link" href="${pageContext.request.contextPath}/adopt/list.do?pageNum=${i}&shelterName=${shelterName}">${i}</a>
               			</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${endPageNum lt totalPageCount }">
					<li class="page-item">
               			<a class="page-link" href="${pageContext.request.contextPath}/adopt/list.do?pageNum=${endPageNum + 1}&shelterName=${shelterName}">Next</a>
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
   <script>
	function formChange(obj)
	{
		//select box 선택 시 JSP페이지로 데이터를 전달
		
		//※obj 변수에는 form 객체가 저장되어 있다.
		//필요에 따라 전송하기 전에 검증 절차를 추가하는 것이 가능하다.
		
		obj.submit(); //obj자체가 form이다.
		//『폼객체.submit();』 함수의 호출을 통해
		//form 객체의 데이터를 서버로 전송하는 것이 가능하다.	
	}
   </script>   
</div>
</body>
</html>





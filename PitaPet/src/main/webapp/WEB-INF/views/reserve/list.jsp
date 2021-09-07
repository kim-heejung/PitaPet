<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<jsp:include page="/resources/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />
<style>
	.board-wrap{
		border:1px solid green;
		text-align:center;
	}
	
	.container{
		/*border:1px solid blue;*/
		
		
	}
	#boaContainer{
		/*
		width:84%;
		margin:auto;
		*/
	}
	
	
	#mainTitle>span{
		display:block;
    	margin-bottom: 14px;
		font-size:2.8rem;
		font-weight:bold;
	}
	#mainTitle{
		padding:100px 0;
    	font-size: 1rem;
		color: #483834;
	}
	
	
	
	table{
		width: 100%;
	    margin-top: 10px;
	    border-top: 2px solid #bb9b6a;
	}
	
	tbody{
	}
	tr{
		border-bottom:1px solid #dadada;
	}
	th{
		padding:16px 0;
	}
	td{
		padding:12px 0;
	}
	
	
	#boaTitle{
		text-align:left; padding-left:40px;
	}
	#boaTitle>a{
		display:inline;
	}
	
	
	#comenCount{
		margin-left:px;
		color:red;
	}
	
	
	#reCheck{
		display:inline;
		padding:6px;
		background-color:blue;
		border-radius:6px;
		font-size:0.8rem;
		color:white;
	}
	#reChecking{
		display:inline;
		padding:6px;
		background-color:red;
		border-radius:6px;
		font-size:0.8rem;
		color:white;
	}
	

	ul{
		display:flex;
		list-style:none;
	}
	ul>li{
		margin-left:5px;
	}
	
	#new{
		display:block;
		/*text-align:right;*/
		margin-top:30px;
		
	}
	#new>a{
		display:inline;
		padding:8px;
		background-color:gray;
		border-radius:4px;
		color:white;
	}
</style>
</head>
<body>
<div id="reserveList">
	<header-component :cpath="cpath" :id="id"></header-component>
	<div class="board-wrap">
		<div class="container">
			<div id="boaContainer">
				<h1 id="mainTitle">
					<span>상담 예약</span>
					핏어펫(Pit a Pet) 방문예약은 인터넷으로 가능합니다. 핏어펫(Pit a Pet)은 모든 문의사항을 친절하게
					상담해 드리고 있습니다.
					<p id="new">
						<a href="${pageContext.request.contextPath}/reserve/private/insertform.do">예약하기</a>
					</p>
				</h1>
				
				<div>
					<table>
						<thead>
							<tr>
								<th>글번호</th>
								<th>지점</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>조회수</th>
								<th>예약 확인</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="tmp" items="${list }">
								<tr>
									<td>${tmp.num }</td>
									<td>${tmp.shelterName }</td>
									<td id="boaTitle">
										<c:choose>
											<c:when test="${id eq tmp.id }">
												<a href="${pageContext.request.contextPath}/reserve/detail.do?pageNum=${pageNum }&num=${tmp.num }">
													${tmp.title }
												</a>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${tmp.scope eq 'private' }">
														<a href="${pageContext.request.contextPath}/reserve/detailcheckform.do?num=${tmp.num }">
															${tmp.title }
														</a>
													</c:when>
													<c:otherwise>
														<a href="${pageContext.request.contextPath}/reserve/detail.do?pageNum=${pageNum }&num=${tmp.num }">
															${tmp.title }
														</a>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
										<span style="">
											<c:forEach var="count" items="${allCount }">
												<c:if test="${tmp.num eq count.ref_group }">
													<span id="comenCount">(${count.cnt })</span>
												</c:if>
											</c:forEach>
										</span>	
									</td>
									<td>${tmp.writer }</td>
									<td>${tmp.regdate }</td>
									<td>${tmp.viewCount }</td>
									<td>
										<c:choose>
											<c:when test="${tmp.checked eq 'yes' }">
												<p id="reCheck">예약 확인</p>
											</c:when>
											<c:otherwise>
												<p id="reChecking">예약 대기</p>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
		
				<nav>
					<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${startPageNum ne 1 }">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/reserve/list.do?pageNum=${startPageNum - 1}">Prev</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link"
									href="javascript:">Prev</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
							<c:choose>
								<c:when test="${i eq pageNum }">
									<li class="page-item active"><a class="page-link"
										href="${pageContext.request.contextPath}/reserve/list.do?pageNum=${i}">${i }</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/reserve/list.do?pageNum=${i}">${i}</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${endPageNum lt totalPageCount }">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/reserve/list.do?pageNum=${endPageNum + 1}">Next</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link"
									href="javascript:">Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	
	<footer-component></footer-component>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script>
	const base_url="http://localhost:8888/spring";
	new Vue({
	    el : "#reserveList",
	    data:{
			cpath: "${pageContext.request.contextPath}",
			id: "${sessionScope.id}",
		   }
	  });	
</script>
</body>
</html>























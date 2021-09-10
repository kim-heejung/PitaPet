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
		text-align:center;
	}
	
	
	.reserveContent{
		margin-bottom:30px;
	}
	
	
	/*
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
	*/
	
	
	.reserveBoard{
		width: 100%;
	    margin-top: 10px;
	    border-top: 2px solid #bb9b6a;
	}
	
	
	.newContent{
		display:block;
		text-align:left;
		margin-bottom:26px;
		
	}
	.newContentLink{
		display:inline;
		padding:10px;
		background-color:#bb9b6a;
		border-radius:4px;
		color:white;
		font-size:1rem;
	}
	
	
	.boardRow{
		border-bottom:1px solid #dadada;
	}
	.boardHeader{
		padding:16px 0;
	}
	.boardColumn{
		padding:12px 0;
	}
	
	.contentTitle{
		text-align:left; padding-left:40px;
	}
	.contentTitleLink{
		display:inline;
	}
	
	.commentCount{
		margin-left:px;
		color:red;
	}
	
	.reserveCheck{
		display:inline;
		font-weight:bold;
		color:red;
	}
	.reserveChecking{
		display:inline;
		font-weight:bold;
		color:#948780;
	}
	
	
	/*
	ul{
		display:flex;
		list-style:none;
	}
	ul>li{
		margin-left:5px;
	}
	*/
</style>
</head>
<body>
<div id="reserveList">
	<header-component :cpath="cpath" :id="id"></header-component>
	<page-category class="reserve" :name="'상담예약'"></page-category>
	<div class="board-wrap">
		
		<div class="container">
			<div>
				<!--  
				<h1 id="mainTitle">
					<span>상담 예약</span>
					핏어펫(Pit a Pet) 방문예약은 인터넷으로 가능합니다. 핏어펫(Pit a Pet)은 모든 문의사항을 친절하게
					상담해 드리고 있습니다.
				</h1>
				-->
				<div class="reserveContent">
					<p class="newContent">
						<a class="newContentLink" href="${pageContext.request.contextPath}/reserve/private/insertform.do">예약하기</a>
					</p>
					<table class="reserveBoard">
						<thead>
							<tr class="boardRow">
								<th class="boardHeader">글번호</th>
								<th class="boardHeader">지점</th>
								<th class="boardHeader">제목</th>
								<th class="boardHeader">작성자</th>
								<th class="boardHeader">등록일</th>
								<th class="boardHeader">조회수</th>
								<th class="boardHeader">예약 확인</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="tmp" items="${list }">
								<tr class="boardRow">
									<td class="boardColumn">${tmp.num }</td>
									<td class="boardColumn">${tmp.shelterName }</td>
									<td class="boardColumn contentTitle">
										<c:choose>
											<c:when test="${id eq tmp.id }">
												<a class="contentTitleLink" href="${pageContext.request.contextPath}/reserve/detail.do?pageNum=${pageNum }&num=${tmp.num }">
													${tmp.title }
												</a>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${tmp.scope eq 'private' }">
														<a class="contentTitleLink" href="${pageContext.request.contextPath}/reserve/detailcheckform.do?num=${tmp.num }">
															${tmp.title }
														</a>
													</c:when>
													<c:otherwise>
														<a class="contentTitleLink" href="${pageContext.request.contextPath}/reserve/detail.do?pageNum=${pageNum }&num=${tmp.num }">
															${tmp.title }
														</a>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
										<span>
											<c:forEach var="count" items="${allCount }">
												<c:if test="${tmp.num eq count.ref_group }">
													<span class="commentCount">(${count.cnt })</span>
												</c:if>
											</c:forEach>
										</span>	
									</td>
									<td class="boardColumn">${tmp.writer }</td>
									<td class="boardColumn">${tmp.regdate }</td>
									<td class="boardColumn">${tmp.viewCount }</td>
									<td class="boardColumn">
										<c:choose>
											<c:when test="${tmp.checked eq 'yes' }">
												<p class="reserveCheck">예약 확인</p>
											</c:when>
											<c:otherwise>
												<p class="reserveChecking">예약 대기</p>
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
<script src="${pageContext.request.contextPath}/resources/js/page_category.js"></script>
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























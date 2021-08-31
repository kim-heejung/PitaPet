<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<style>
	ul{
		display:flex;
		list-style:none;
	}
	ul>li{
		margin-left:5px;
	}
</style>
</head>
<body>
	<div class="container">
		<a href="${pageContext.request.contextPath}/reserve/insertform.do">글쓰기</a>
		<h1>상담 예약</h1>
		<p>핏어펫(Pit a Pet) 방문예약은 인터넷으로 가능합니다. 핏어펫(Pit a Pet)은 모든 문의사항을 친절하게
			상담해 드리고 있습니다.</p>
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>지점</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>등록일</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td>${tmp.num }</td>
						<td>${tmp.shelterName }</td>
						<td><a
							href="${pageContext.request.contextPath}/reserve/detail.do?num=${tmp.num }">${tmp.title }</a></td>
						<td>${tmp.writer }</td>
						<td>${tmp.viewCount }</td>
						<td>${tmp.regdate }</td>
						<td>예약완료 여부</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

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
</body>
</html>























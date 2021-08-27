<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
<style>
.page-ui a {
	text-decoration: none;
	color: #000;
}

.page-ui a:hover {
	text-decoration: underline;
}

.page-ui a.active {
	color: red;
	font-weight: bold;
	text-decoration: underline;
}

.page-ui ul {
	list-style-type: none;
	padding: 0;
}

.page-ui ul>li {
	float: left;
	padding: 5px;
}
</style>
</head>
<body>
	<div class="container">
		<a href="insertform.do">새글 작성</a>
		<h1>글 목록 입니다</h1>
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td>${tmp.num }</td>
						<td>${tmp.id }</td>
						<td>
							<a
							href="detail.do?num=${tmp.num }">${tmp.title }</a></td>
						<td>${tmp.viewCount }</td>
						<td>${tmp.reservedDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="page-ui">
			<ul>
				<c:if test="${startPageNum ne 1 }">
					<li><a
						href="list.do?pageNum=${startPageNum-1 }">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li><c:choose>
							<c:when test="${pageNum eq i }">
								<a class="active"
									href="list.do?pageNum=${i }">${i }</a>
							</c:when>
							<c:otherwise>
								<a
									href="list.do?pageNum=${i }">${i }</a>
							</c:otherwise>
						</c:choose></li>
				</c:forEach>
				<c:if test="${endPageNum lt totalPageCount }">
					<li><a
						href="list.do?pageNum=${endPageNum+1 }">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
		<div style="clear: both;"></div>
	</div>
</body>
</html>























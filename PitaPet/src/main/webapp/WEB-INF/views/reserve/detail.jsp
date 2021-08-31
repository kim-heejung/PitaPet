<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<style>
</style>
</head>
<body>
<div class="container">
   <table>
      <tr>
         <th>글번호</th>
         <td>${dto.num }</td>
      </tr>
      <tr>
         <th>예약한 지점</th>
         <td>${dto.shelterName }</td>
      </tr>
      <tr>
         <th>제목</th>
         <td>${dto.title }</td>
      </tr>
      <tr>
         <th>작성자</th>
         <td>${dto.writer }</td>
      </tr>
      <tr>
         <th>조회수</th>
         <td>${dto.viewCount }</td>
      </tr>
      <tr>
         <th>등록일</th>
         <td>${dto.regdate }</td>
      </tr>
      <tr>
         <th>예약 날짜</th>
         <td>${dto.reservedDate }</td>
      </tr>
      <tr>
         <th>예약 시간</th>
         <td>${dto.reservedTime}</td>
      </tr>
      <tr>
         <th>예약자 이름</th>
         <td>${dto.name }</td>
      </tr>
      <tr>
         <th>예약자 연락처</th>
         <td>${dto.phoneNumber }</td>
      </tr>
      <tr>
         <th>내용</th>
         <td>${dto.content }</td>
      </tr>
   </table>
    
   <ul>
      <li><a href="${pageContext.request.contextPath}/reserve/list.do">목록보기</a></li>
      <c:if test="${dto.writer eq id }">
         <li><a href="${pageContext.request.contextPath}/reserve/updateform.do?num=${dto.num }">수정</a></li>
         <li><a href="${pageContext.request.contextPath}/api/reserve/delete.do?num=${dto.num }">삭제</a></li>
      </c:if>
   </ul>
</div>
</body>
</html>







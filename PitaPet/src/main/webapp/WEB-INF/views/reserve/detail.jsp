<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/detail.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<style>
   .content{
      border: 1px dotted gray;
   }
   
   /* 댓글 프로필 이미지를 작은 원형으로 만든다. */
   .profile-image{
      width: 50px;
      height: 50px;
      border: 1px solid #cecece;
      border-radius: 50%;
   }
   /* ul 요소의 기본 스타일 제거 */
   .comments ul{
      padding: 0;
      margin: 0;
      list-style-type: none;
   }
   .comments dt{
      margin-top: 5px;
   }
   .comments dd{
      margin-left: 50px;
   }
   .comment-form textarea, .comment-form button{
      float: left;
   }
   .comments li{
      clear: left;
   }
   .comments ul li{
      border-top: 1px solid #888;
   }
   .comment-form textarea{
      width: 84%;
      height: 100px;
   }
   .comment-form button{
      width: 14%;
      height: 100px;
   }
   /* 댓글에 댓글을 다는 폼과 수정폼은 일단 숨긴다. */
   .comments .comment-form{
      display: none;
   }
   /* .reply_icon 을 li 요소를 기준으로 배치 하기 */
   .comments li{
      position: relative;
   }
   .comments .reply-icon{
      position: absolute;
      top: 1em;
      left: 1em;
      color: red;
   }
   pre {
     display: block;
     padding: 9.5px;
     margin: 0 0 10px;
     font-size: 13px;
     line-height: 1.42857143;
     color: #333333;
     word-break: break-all;
     word-wrap: break-word;
     background-color: #f5f5f5;
     border: 1px solid #ccc;
     border-radius: 4px;
   }   
   
   .loader{
      /* 로딩 이미지를 가운데 정렬하기 위해 */
      text-align: center;
      /* 일단 숨겨 놓기 */
      display: none;
   }   
   
   .loader svg{
      animation: rotateAni 1s ease-out infinite;
   }
   
   @keyframes rotateAni{
      0%{
         transform: rotate(0deg);
      }
      100%{
         transform: rotate(360deg);
      }
   }
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
         <th>제목</th>
         <td>${dto.title }</td>
      </tr>
      <tr>
         <th>작성자</th>
         <td>${dto.id }</td>
      </tr>
      <tr>
         <th>조회수</th>
         <td>${dto.viewCount }</td>
      </tr>
      <tr>
         <th>등록일</th>
         <td>${dto.reservedDate }</td>
      </tr>
      <tr>
         <th>등록일</th>
         <td>${dto.reservedTime}</td>
      </tr>
      <tr>
         <th>등록일</th>
         <td>${dto.name }</td>
      </tr>
      <tr>
         <th>등록일</th>
         <td>${dto.phoneNumber }</td>
      </tr>
   </table>
     
   <ul>
      <li><a href="list.do">목록보기</a></li>
      <c:if test="${dto.id eq id }">
         <li><a href="${pageContext.request.contextPath}/reserve/updateform2.do?num=${dto.num }">수정</a></li>
         <li><a href="${pageContext.request.contextPath}/api/reserve/delete.do?num=${dto.num }">삭제</a></li>
      </c:if>
   </ul>
   
   
</div>
</body>
</html>







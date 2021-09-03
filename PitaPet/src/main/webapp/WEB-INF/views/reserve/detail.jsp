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
         <li><a href="${pageContext.request.contextPath}/reserve/private/updateform.do?num=${dto.num }">수정</a></li>
         <li><a href="${pageContext.request.contextPath}/api/reserve/delete.do?num=${dto.num }">삭제</a></li>
      </c:if>
      <br />
      <c:forEach var="check" items="${checked }">
      	<c:if test="${check.id eq id and check.name eq dto.shelterName}">
      		<c:choose>
      			<c:when test="${dto.checked eq 'yes' }">
      				<a href="${pageContext.request.contextPath}/api/reserve/checkedno.do?num=${dto.num}">예약 취소</a>
      			</c:when>
      			<c:otherwise>
      				<a href="${pageContext.request.contextPath}/api/reserve/checkedyes.do?num=${dto.num}">예약 확정</a>
      			</c:otherwise>
      		</c:choose>
      		
      	</c:if>
      </c:forEach>
   </ul>
 
   <!-- 댓글 목록 -->
   <div class="comments">
      <ul>
         <c:forEach var="tmp" items="${commentList }">
            <c:choose>
               <c:when test="${tmp.deleted eq 'yes' }">
                  <li>삭제된 댓글 입니다.</li>
               </c:when>
               <c:otherwise>
                  <c:if test="${tmp.num eq tmp.comment_group }">
                     <li id="reli${tmp.num }">
                  </c:if>
                  <c:if test="${tmp.num ne tmp.comment_group }">
                     <li id="reli${tmp.num }" style="padding-left:50px;">
                        <svg class="reply-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
                             <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
                        </svg>
                  </c:if>
                        <dl>
                           <dt>
                              <span>${tmp.writer }</span>
                              <c:if test="${tmp.num ne tmp.comment_group }">
                                 @<i>${tmp.target_id }</i>
                              </c:if>
                              <span>${tmp.regdate }</span>
                              <a data-num="${tmp.num }" href="javascript:" class="reply-link">답글</a>
                              <c:if test="${ (id ne null) and (tmp.writer eq id) }">
                                 <a data-num="${tmp.num }" class="update-link" href="javascript:">수정</a>
                                 <a data-num="${tmp.num }" class="delete-link" href="${pageContext.request.contextPath}/api/reserve/commentdelete.do?num=${tmp.num}">삭제</a>
								 <!-- 쌤이 원래는 이런 방식으로 하셨습니다. 헷갈리실 까봐 남겨놓습니다. -->
								 <!--<a data-num="${tmp.num }" class="delete-link" href="javascript:">삭제</a>-->
                              </c:if>
                           </dt>
                           <dd>
                              <pre id="pre${tmp.num }">${tmp.content }</pre>                  
                           </dd>
                        </dl>
                        <!-- 대댓글 -->
                        <form id="reForm${tmp.num }" class="animate__animated comment-form re-insert-form" action="${pageContext.request.contextPath}/api/reserve/commentinsert.do" method="post">
                           <input type="hidden" name="ref_group" value="${dto.num }"/>
                           <input type="hidden" name="target_id" value="${tmp.writer }"/>
                           <input type="hidden" name="comment_group" value="${tmp.comment_group }"/>
                           <textarea name="content"></textarea>
                           <button type="submit">등록</button>
                        </form>
                     <c:if test="${tmp.writer eq id }">
                        <form id="updateForm${tmp.num }" class="comment-form update-form" action="${pageContext.request.contextPath}/api/reserve/commentupdate.do" method="post">
                           <input type="hidden" name="num" value="${tmp.num }" />
                           <textarea name="content">${tmp.content }</textarea>
                           <button type="submit">수정</button>
                        </form>
                     </c:if>
                     </li>      
               </c:otherwise>
            </c:choose>
         </c:forEach>
      </ul>
   </div>      
   <div class="loader">
      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
           <path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"/>
           <path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"/>
      </svg>
   </div>
   
   <!-- 원글에 댓글을 작성할 폼 -->
   <form class="comment-form insert-form" action="${pageContext.request.contextPath}/api/reserve/commentinsert.do" method="post">
      <!-- 원글의 글번호가 댓글의 ref_group 번호가 된다. -->
      <input type="hidden" name="ref_group" value="${dto.num }"/>
      <!-- 원글의 작성자가 댓글의 대상자가 된다. -->
      <input type="hidden" name="target_id" value="${dto.writer }"/>
      
      <textarea name="content">${empty id ? '댓글 작성을 위해 로그인이 필요 합니다.' : '' }</textarea>
      <button type="submit">등록</button>
   </form>
   
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
   //쌤이 원래는 이런 방식으로 하셨습니다. 헷갈리실 까봐 남겨놓습니다.
   addDeleteListener(".delete-link");
   
   function addDeleteListener(sel){
      //댓글 삭제 링크의 참조값을 배열에 담아오기 
      let deleteLinks=document.querySelectorAll(sel);
      for(let i=0; i<deleteLinks.length; i++){
         deleteLinks[i].addEventListener("click", function(){
            //click 이벤트가 일어난 바로 그 요소의 data-num 속성의 value 값을 읽어온다. 
            const num=this.getAttribute("data-num"); //댓글의 글번호
            const isDelete=confirm("댓글을 삭제 하시겠습니까?");
            if(isDelete){
               // gura_util.js 에 있는 함수들 이용해서 ajax 요청
               ajaxPromise("reserve/private/comment_delete.do", "post", "num="+num)
               .then(function(response){
                  return response.json();
               })
               .then(function(data){
                  //만일 삭제 성공이면 
                  if(data.isSuccess){
                     //댓글이 있는 곳에 삭제된 댓글입니다를 출력해 준다. 
                     document.querySelector("#reli"+num).innerText="삭제된 댓글입니다.";
                  }
               });
            }
         });
      }
   }

</script>
</body>
</html>






   








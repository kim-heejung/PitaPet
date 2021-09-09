<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<jsp:include page="/resources/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />
<style>
	.container{
		width:100%;
	}
	
	
	/*
	#mainTitle{
		padding:100px 0;
    	font-size: 1rem;
		color: #483834;
	}
	#mainTitle>span{
		display:block;
    	margin-bottom: 14px;
		font-size:2.8rem;
		font-weight:bold;
	}
	*/
	
	
	.detailContainer{
		border-top: 2px solid #bb9b6a;
	}
	.detailList{
		padding:12px 0;
	}
	
	/*
	#detailContainer>div{
		display:flex;
		border:1px solid red;
	}
	#detailContainer>div>span{
		display:block;
	}*/
	
	.detailHeader{
		display:flex;
		align-items:center;
		padding-bottom:0;
		border-bottom:1px solid #dadada;
	}
	.titleLeft{
		flex:1;
		text-align:left;	
	}
	.HeaderMargin{
		margin:0 26px;
	}
	.titleCenter{
		flex:4;
		text-align:center;
	}
	.titleRight{
		flex:1;
		text-align:right;
	}
	
	.detailWriter{
		text-align:right;
	}
	.detailViewCount{
		display:inline;
		margin-left:10px;
	}
	
	.detailContent{
		text-align:left;
		border-bottom:1px solid #dadada;
	}
	
	.buttonList{
		display:flex;
		padding:20px 0 0 0;
		list-style:none;
		margin-bottom:40px;
	}
	.shelterBtnList{
		flex:1;
		text-align:left;
	}
	.usersBtnList{
		flex:1;
		text-align:right;
	}
	.allButton{
		border-radius:6px;
		padding:10px;
		background-color:#bb9b6a;
		font-size:1.1rem;
		display:inline;
		color:white;
	}
	
	
	.commentsList{
		text-align:left;
	}
</style>
</head>
<body>
<div id="reserveDetail">
	<header-component :cpath="cpath" :id="id"></header-component>
	<div class="board-wrap">
		<page-category class="reserve" :name="'상담예약'"></page-category>
		<div class="container">
			<!--  
			<h1 id="mainTitle">
				<span>상담 예약</span>
				핏어펫(Pit a Pet) 방문예약은 인터넷으로 가능합니다. 핏어펫(Pit a Pet)은 모든 문의사항을 친절하게
				상담해 드리고 있습니다.
			</h1>
			-->
		 	<div class="detailContainer">
		   		<div class="detailList detailHeader">
		   			<p class="detailHeaderList titleLeft">
		   				<span>
							${dto.num }
				    	</span>
				    	<span class="HeaderMargin">
				        	${dto.shelterName }
				    	</span>
		   			</p>
			    	<p class="detailHeaderList titleCenter">
			        	${dto.title }
			    	</p>
			    	<p class="detailHeaderList titleRight">
			        	${dto.regdate }
			    	</p>
		   	  	</div>
		      	<div class="detailList detailWriter">
		      		<span>
		        		${dto.writer }
		      		</span>
		      		<p class="detailViewCount">
		         		<span>조회수</span>
		         		${dto.viewCount }
		      		</p>
		      	</div>
		      	<div class="detailList detailContent">
			      	<p>
			         	<span>예약 날짜 : </span>
			         	${dto.reservedDate }
			      	</p>
			      	<p>
			         	<span>예약 시간 : </span>
			         	${dto.reservedTime}
			      	</p>
			      	<p>
			         	<span>예약자 이름 : </span>
			         	${dto.name }
			      	</p>
			      	<p>
			         	<span>예약자 연락처 : </span>
			         	${dto.phoneNumber }
			      	</p>
			      	<p>
			         	<span>문의 내용 : </span>
			         	${dto.content }
			      	</p>
		      	</div>   
		   </div>

		   <ul class="buttonList">
		      <li class="shelterBtnList">
		      	<c:forEach var="check" items="${checked }">
					<c:if test="${check.id eq id and check.name eq dto.shelterName}">
				    	<c:choose>
				      		<c:when test="${dto.checked eq 'yes' }">
				      			<a class="allButton" href="${pageContext.request.contextPath}/api/reserve/checkedno.do?num=${dto.num}">예약 취소</a>
				      		</c:when>
				      		<c:otherwise>
				      			<a class="allButton" href="${pageContext.request.contextPath}/api/reserve/checkedyes.do?num=${dto.num}">예약 확정</a>
				      		</c:otherwise>
				      	</c:choose>
				    </c:if>
				</c:forEach>
		      </li>
			  <li class="usersBtnList">
			  	<a class="allButton" href="${pageContext.request.contextPath}/reserve/list.do">목록보기</a>
			 	<c:if test="${dto.writer eq id }">
			    	<a class="allButton" href="${pageContext.request.contextPath}/reserve/private/updateform.do?num=${dto.num }">수정</a>
			        <a class="allButton" href="${pageContext.request.contextPath}/api/reserve/delete.do?num=${dto.num }">삭제</a>
			  	</c:if>
			  </li>
		   	  	
		      <br />
		      
		      	
		      
		      
		   </ul>

		   <!-- 댓글 목록 -->
		   <div class="commentsList">
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
	</div>
	<footer-component></footer-component>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/page_category.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	const base_url="http://localhost:8888/spring";
	new Vue({
	    el : "#reserveDetail",
	    data:{
			cpath: "${pageContext.request.contextPath}",
			id: "${sessionScope.id}",
		   }
	  });

   
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






   








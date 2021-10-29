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
	.allButton:hover{
		color:white;
	}
	
	
	
	/*댓글*/
	.comments{
		text-align:left;
	}
	
	/* ul 요소의 기본 스타일 제거 */
   .comments ul{
      padding: 0;
      margin: 0;
      list-style-type: none; 
      margin-bottom:20px; 
   }
   .comments li{
   	  clear:left;
      
   }
   .comments dt{
      margin-top: 10px;   
   }
   .comments dd{
		margin-top:10px;
   }
   .comment-form textarea, .comment-form button{
      float: left;
   }
   .comment-form textarea{
      width: 84%;
      height: 100px;
   }
   .comment-form button{
      width: 16%;
      height: 100px;
   }
   
   /* 댓글에 댓글을 다는 폼과 수정폼은 일단 숨긴다. */
   .comments .comment-form{
      /*display: none;*/
   }
   .comment-form{
		display:inline-block;
		width:100%;
	}
   
   /* .reply_icon 을 li 요소를 기준으로 배치 하기 */
   .comments li{
      position: relative;
      overflow:hidden;
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
   
   
	.reply-title{
		margin-bottom:8px;
	}
	
	.reply-users-items a{
		display:inline;
	}
	.myReply-list{
		margin-left:4px;
	}
</style>
</head>
<body>
<div id="reserveDetail">
	<header-component :cpath="cpath" :id="id"></header-component>
	<page-category class="reserve" :name="'상담예약'"></page-category>
	<div class="board-wrap">
		<page-category class="reserve" :cpath="cpath" :index="5"></page-category>
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
				      			<a class="allButton" href="${pageContext.request.contextPath}/api/reserve/reserveno.do?num=${dto.num}">예약 취소</a>
				      		</c:when>
				      		<c:otherwise>
				      			<a class="allButton" href="${pageContext.request.contextPath}/api/reserve/reserveyes.do?num=${dto.num}">예약 확정</a>
				      		</c:otherwise>
				      	</c:choose>
				    </c:if>
				</c:forEach>
		      </li>
			  <li class="usersBtnList">
			  	<a class="btn allButton" href="${pageContext.request.contextPath}/reserve/list.do">목록보기</a>
			 	<c:if test="${dto.writer eq id }">
			    	<a class="btn allButton" href="${pageContext.request.contextPath}/reserve/private/updateform.do?num=${dto.num }">수정</a>
			        <a class="btn allButton reserveDel" id="best" href="javascript:reserveDeleteList()">삭제</a>
			  	</c:if>
			  </li>
		   </ul>
			<div class="comments">
				<p class="reply-title">
					<!--  
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
			  			<path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
			  			<path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
					</svg>
					-->
					댓글 
					<c:forEach var="countList" items="${commentCountList }">
						<c:if test="${dto.num eq countList.ref_group }">
            				<span>${countList.cnt }</span>
            			</c:if>
					</c:forEach>
				</p>
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
                           			<dt class="reply-list-users">
                              			<span class="reply-users-items">${tmp.writer }</span>
                              			<c:if test="${tmp.num ne tmp.comment_group }">
                                 			@<i class="reply-users-items">${tmp.target_id }</i>
                              			</c:if>
                              			<span class="reply-users-items">${tmp.regdate }</span>
                              			<span class="reply-users-items myReply-list">
                   							<a data-num="${tmp.num }" class="reply-link" href="javascript:">답글</a>
                              				<c:if test="${ (id ne null) and (tmp.writer eq id) }">
                                 				<a data-num="${tmp.num }" class="update-link" href="javascript:">수정</a>
                                 				<a data-num="${tmp.num }" class="delete-link" href="javascript:">삭제</a>
                              				</c:if>
                              			</span>
                           			</dt>
                           			<dd>
                              			<pre id="pre${tmp.num }">${tmp.content }</pre>                  
                           			</dd>
                        		</dl>
                        		<form id="reForm${tmp.num }" class="animate__animated comment-form re-insert-form" action="${pageContext.request.contextPath}/reserve/private/commentinsert.do" method="post">
                           			<input type="hidden" name="pageNum" value="${pageNum }"/>
                           			<input type="hidden" name="ref_group" value="${dto.num }"/>
                           			<input type="hidden" name="target_id" value="${tmp.writer }"/>
                           			<input type="hidden" name="comment_group" value="${tmp.comment_group }"/>
                           			<textarea name="content"></textarea>
                           			<button type="submit">등록</button>
                        		</form>
                     			<c:if test="${tmp.writer eq id }">
                        			<form id="updateForm${tmp.num }" class="comment-form update-form" action="${pageContext.request.contextPath}/api/reserve/commentupdate.do" method="post">
                           				<input type="hidden" name="pageNum" value="${pageNum }"/>
                           				<input type="hidden" name="ref_group" value="${dto.num }"/>
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
			<!-- 원글에 댓글을 작성할 폼 -->
			<form class="comment-form insert-form" action="${pageContext.request.contextPath}/reserve/private/commentinsert.do" method="post">
      			<input type="hidden" name="pageNum" value="${pageNum }"/>
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
</body>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/page_category.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>

<script>
	const base_url="http://localhost:8888/spring";
	new Vue({
	    el : "#reserveDetail",
	    data:{
			cpath: "${pageContext.request.contextPath}",
			id: "${sessionScope.id}",
		   }
	  });
	
		
	function reserveDeleteList(){
		document.querySelector(".reserveDel").addEventListener("click", function(){
			if(confirm("정말 삭제하시겠습니까?")){
				location.href="${pageContext.request.contextPath}/reserve/delete.do?num=${dto.num }";
			}
		});
	}
	
	
	addReplyListener(".reply-link");
	addUpdateFormListener(".update-link");
	addDeleteListener(".delete-link");

	function addReplyListener(sel){
		let replyLinks=document.querySelectorAll(sel);
		for(let i=0; i<replyLinks.length; i++){
			replyLinks[i].addEventListener("click", function(){
				const num=this.getAttribute("data-num");
	            const form=document.querySelector("#reForm"+num);
	            let current = this.innerText;
	            if(current == "답글"){
	            	form.style.display="block";
		            this.innerText="취소";
	            }else if(current == "취소"){
	                this.innerText="답글";
	                form.style.display="none";
	             }
			});
		}
	}
	
	function addUpdateFormListener(sel){
		let updateForms=document.querySelectorAll(sel);
		for(let i=0; i<updateForms.length; i++){
			updateForms[i].addEventListener("click", function(){
				const num=this.getAttribute("data-num"); //댓글의 글번호
	            document.querySelector("#updateForm"+num).style.display="block";		
			});
		}
	}
   
	function addDeleteListener(sel){
    	//댓글 삭제 링크의 참조값을 배열에 담아오기 
      	let deleteLinks=document.querySelectorAll(sel);
      	for(let i=0; i<deleteLinks.length; i++){
        	deleteLinks[i].addEventListener("click", function(){
	            //click 이벤트가 일어난 바로 그 요소의 data-num 속성의 value 값을 읽어온다. 
	            const num=this.getAttribute("data-num"); //댓글의 글번호
	            const isDelete=confirm("댓글을 삭제하시겠습니까?");
	            if(isDelete){
	               location.href="${pageContext.request.contextPath}/api/reserve/commentdelete.do?pageNum=${pageNum}&ref_group=${dto.num}&num="+num;
	            }
        	});
      	}
	}	
	
</script>
</html>






   








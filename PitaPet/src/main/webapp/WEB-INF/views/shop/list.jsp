<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<style>
.shopBtn {
	border: none;
	display: inline;
	padding: 8px;
	background-color: #a369e0;
	border-radius: 4px;
	color: white;
	opacity: 0.8;
}
.shopBtn2 {
	border: none;
	display: inline;
	padding: 8px;
	background-color: grey;
	border-radius: 4px;
	color: white;
	opacity: 0.6;
}


#shopCategory {
  text-align:center;
}
.list {
  display:inline-block;
}
p {
	color: #aaa;
	margin-bottom: 10px;
}
p:hover {
	color: #fff
}
span {
	position: relative;
	font-weight: bold;
	color: #fff;
}
span::after {
	content: '';
	display: block;
	width: 0;
	height: 5px;
	position: absolute;
	left: 0;
	bottom: 0px;
	background: rgba(200, 125, 220, .6);
}
p:hover span::after {
	width: 100%;
	transition: width .3s;
}	
Resources1× 0.5× 0.25×Rerun
</style>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<jsp:include page="/resources/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />
</head>
<body>
<div id="itemList">
	<header-component :cpath="cpath" :id="id"></header-component>
	<div class="board-wrap">
	<page-category class="shop" :name="'핏어팻몰'"></page-category>
	<div class="container">
	   <c:if test="${id eq 'admin'}">
	      <a  class="float-end mb-2 btn btn-light btn-sm" href="${pageContext.request.contextPath}/shop/insertForm.do">
			상품 추가
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag-plus" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M8 7.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V12a.5.5 0 0 1-1 0v-1.5H6a.5.5 0 0 1 0-1h1.5V8a.5.5 0 0 1 .5-.5z"/>
			  <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
			</svg>
		  </a>
	   </c:if>
	   <div class="shopCategory">
	   		<p class="list"><span class="btn" onclick="location.href='${pageContext.request.contextPath}/shop/list.do?category=food'">사료</span></p> 
		   	<p class="list"><span class="btn" onclick="location.href='${pageContext.request.contextPath}/shop/list.do?category=snack'">간식</span></p>
		   	<p class="list"><span class="btn" onclick="location.href='${pageContext.request.contextPath}/shop/list.do?category=toy'">장난감</span></p>	   
	   </div>
	   <div class="row">
	      <c:forEach var="tmp" items="${list }">
	         <div class="col-3">
	            <div class="card">
	               <img class="card-img-top" src="${pageContext.request.contextPath}${tmp.imgPath}"/>
	               <div class="card-body">
	                  <h5 class="card-title">${tmp.name }
	                     <c:choose>
	                        <c:when test="${tmp.category eq 'food' }"><span class="badge rounded-pill bg-success">사료</span></c:when>
	                        <c:when test="${tmp.category eq 'snack' }"><span class="badge rounded-pill bg-warning">간식</span></c:when>
	                        <c:when test="${tmp.category eq 'toy' }"><span class="badge rounded-pill bg-info">장난감</span></c:when>
	                     </c:choose>
	                  </h5>
	                  <p class="card-text">
	                     가격 : <strong>${tmp.price }</strong>원 <br/>
	                     재고 : <strong>${tmp.remainCount }</strong>개
	                  </p>
	          <button type="button" class="shopBtn purchaseBtn" data-bs-toggle="modal" data-bs-target="#exampleModal-${tmp.num}" data-num="${tmp.num}">
	                    구입하기
	          </button>
	               </div>
	            </div>
	         </div>      
	      
	      <!-- 구매하기 Modal 폼 -->
	      <div class="modal fade" id="exampleModal-${tmp.num }" tabindex="-1">
	        <div class="modal-dialog">
	          <div class="modal-content">
	            <div class="modal-header">
	              <h5 class="modal-title">Pit a Pet</h5>
	            </div>
	            <div class="modal-body">
	               <form action="${pageContext.request.contextPath}/shop/buy.do?num=${tmp.num}" id="purchaseForm-${tmp.num }" method="post" name="shopForm">
	                 <div class="mb-4">
	                  <label for="product" class="col-form-label fw-bold">상품명</label>
	                  	<input type="text" class="form-control" name="product" value="${tmp.name }" readonly />
	                 </div>
	                  <div class="mb-3">
	                   <label for="amount" class="col-form-label fw-bold">수량</label>
	                   	<a href="javascript:" class="plusAmount" data-num="${tmp.num}"><img src="${pageContext.request.contextPath}/resources/images/Caret-Up.svg" width="22" height="22"></a>
	                    <input type="text" name="amount" id="amount-${tmp.num }" value="1" style="width:25px;" />
	                    <a href="javascript:" class="minusAmount" data-num="${tmp.num}"><img src="${pageContext.request.contextPath}/resources/images/Caret-Down.svg" width="22" height="22"></a>
	                 </div>
	                 <div class="mb-3">
	               	  <label for="price" class="col-form-label fw-bold">가격</label>
	                  	<input type="hidden" class="form-control" name="price" id="total_amount-${tmp.num }" value=${tmp.price } />
	                  	<input type="text" class="form-control" value=${tmp.price } id="total_amount_price-${tmp.num }" readonly />                 
	                 </div>
	                 <div class="mb-3">
	                  <label for="name" class="col-form-label">주문자</label>
	                  	<input type="text" class="form-control" name="name" id="name-${tmp.num }" />
	                 </div> 
	                 <div class="mb-3">
	                  <label for="phoneNum" class="col-form-label">휴대전화</label>
	                  	<input type="tel" class="form-control" name="phoneNum" id="phone-${tmp.num }" />
	                 </div>
	               <div class="mb-3">
	                  <label for="email" class="col-form-label">이메일</label>
	                  	<input type="email" class="form-control" name="email" id="email-${tmp.num }"/>
	                 </div>
	                <div class="mb-3">
	                  <label for="addr" class="col-form-label">주소</label>
	                  	<input type="text" class="form-control" name="addr" id="addr-${tmp.num }"/>
	                 </div>                        
	                </form> 
	            </div>
	            <div class="modal-footer">
	               <button type="submit" class="shopBtn buyNowBtn" data-num="${tmp.num}">바로 구매하기</button>
	              <button type="button" class="shopBtn2" data-bs-dismiss="modal">닫기</button>              
	            </div>
	          </div>
	        </div>
	      </div>
	   
	   </c:forEach>
	   </div>
	   
	   <nav>
	   <ul class="pagination justify-content-center">
	      <c:choose>
	         <c:when test="${startPageNum ne 1 }">
	            <li class="page-item">
	                     <a class="page-link" href="${pageContext.request.contextPath}/shop/list.do?pageNum=${startPageNum - 1}">Prev</a>
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
	                        <a class="page-link" href="${pageContext.request.contextPath}/shop/list.do?pageNum=${i}">${i }</a>
	                     </li>
	            </c:when>
	            <c:otherwise>
	               <li class="page-item">
	                        <a class="page-link" href="${pageContext.request.contextPath}/shop/list.do?pageNum=${i}">${i}</a>
	                     </li>
	            </c:otherwise>
	         </c:choose>
	      </c:forEach>
	      <c:choose>
	         <c:when test="${endPageNum lt totalPageCount }">
	            <li class="page-item">
	                     <a class="page-link" href="${pageContext.request.contextPath}/shop/list.do?pageNum=${endPageNum + 1}">Next</a>
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
	</div>
	<footer-component></footer-component>
</div>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/page_category.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	const base_url="http://localhost:8888/spring";
	new Vue({
	    el : "#itemList",
	    data:{
			cpath: "${pageContext.request.contextPath}",
			id: "${sessionScope.id}",
		   }
	  });

	let btns=document.querySelectorAll(".purchaseBtn");
	for(let i=0; i<btns.length; i++){
		btns[i].addEventListener("click",function(){
			const num=this.getAttribute("data-num");
			if(${empty id}){
				alert("로그인이 필요합니다");
				location.href="${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/shop/list.do";
			}else{
				
				ajaxPromise("${pageContext.request.contextPath}/api/users/info.do")
				.then(function(response){
					return response.json();
				})
				.then(function(data){
					document.querySelector("#addr-"+num).value=data.UsersDto.address;
					document.querySelector("#name-"+num).value=data.UsersDto.name;
					document.querySelector("#email-"+num).value=data.UsersDto.email;
					document.querySelector("#phone-"+num).value=data.UsersDto.phoneNumber;
				});
			}
			
			
			
		})
	}
	
	
	let buyNowBtns=document.querySelectorAll(".buyNowBtn");
	for(let i=0; i<buyNowBtns.length; i++){
		buyNowBtns[i].addEventListener("click", function(){
			const num=this.getAttribute("data-num");
			document.querySelector("#purchaseForm-"+num).submit();
		});
	}

  
   let amount = 1;
 
   let plusAmount=document.querySelectorAll(".plusAmount");
   for(let i=0; i<plusAmount.length; i++){
	   plusAmount[i].addEventListener("click", function(){
		   const num=this.getAttribute("data-num");
		   let amountEl = document.querySelector("#amount-"+num);
		   let total_amount = document.querySelector("#total_amount-"+num);
		   let total_amount_price = document.querySelector("#total_amount_price-"+num);
		   
		   amount++;
		   amountEl.value = amount;
		   total_amount_price.value = total_amount.value * amountEl.value;
		   total_amount.value = total_amount_price.value;
	   });
   }
   
   let minusAmount=document.querySelectorAll(".minusAmount");
   for(let i=0; i<minusAmount.length; i++){
	   minusAmount[i].addEventListener("click", function(){
		   const num=this.getAttribute("data-num");
		   let amountEl = document.querySelector("#amount-"+num);
		   let total_amount = document.querySelector("#total_amount-"+num);
		   let total_amount_price = document.querySelector("#total_amount_price-"+num);
		   
			if(amount > 1){
				amount--;
				amountEl.value = amount;
				total_amount_price.value = total_amount_price.value - total_amount.value;
			}
	   });
   }
   
   
</script>
</body>
</html>



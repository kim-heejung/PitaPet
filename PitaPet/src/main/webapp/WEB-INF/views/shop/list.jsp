<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/shop/list.jsp</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">

   <h1>상품 목록 입니다.</h1>
   <c:if test="${id eq 'admin'}">
      <a href="${pageContext.request.contextPath}/shop/insertForm.do">상품 추가하기</a>
   </c:if>
   <a class="btn" href="${pageContext.request.contextPath}/shop/list.do?category=food">사료</a> | 
   <a class="btn" href="${pageContext.request.contextPath}/shop/list.do?category=snack">간식</a> |
   <a class="btn" href="${pageContext.request.contextPath}/shop/list.do?category=toy">장난감</a>
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
                  <button type="button" class="btn btn-primary purchaseBtn" data-bs-toggle="modal" data-bs-target="#exampleModal-${tmp.num}" data-num="${tmp.num}">
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
                   <label for="count" class="col-form-label fw-bold">수량</label>
                   	<a href="javascript:" class="plusCount" data-num="${tmp.num}"><img src="${pageContext.request.contextPath}/resources/images/Caret-Up.svg" width="22" height="22"></a>
                    <input type="text" name="count" id="count-${tmp.num }" value="1" style="width:25px;" />
                    <a href="javascript:" class="minusCount" data-num="${tmp.num}"><img src="${pageContext.request.contextPath}/resources/images/Caret-Down.svg" width="22" height="22"></a>
                 </div>
                 <div class="mb-3">
               	  <label for="price" class="col-form-label fw-bold">가격</label>
                  	<input type="hidden" class="form-control" name="price" id="total_count-${tmp.num }" value=${tmp.price } />
                  	<input type="text" class="form-control" value=${tmp.price } id="total_count_price-${tmp.num }" readonly />                 
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
               <button type="submit" class="btn btn-primary buyNowBtn" data-num="${tmp.num}">바로 구매하기</button>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>              
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
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>

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

  
   let count = 1;
 
   let plusCount=document.querySelectorAll(".plusCount");
   for(let i=0; i<plusCount.length; i++){
	   plusCount[i].addEventListener("click", function(){
		   const num=this.getAttribute("data-num");
		   let countEl = document.querySelector("#count-"+num);
		   let total_count = document.querySelector("#total_count-"+num);
		   let total_count_price = document.querySelector("#total_count_price-"+num);
		   
		   count++;
		   countEl.value = count;
		   total_count_price.value = total_count.value * countEl.value; 
	   });
   }
   
   let minusCount=document.querySelectorAll(".minusCount");
   for(let i=0; i<minusCount.length; i++){
	   minusCount[i].addEventListener("click", function(){
		   const num=this.getAttribute("data-num");
		   let countEl = document.querySelector("#count-"+num);
		   let total_count = document.querySelector("#total_count-"+num);
		   let total_count_price = document.querySelector("#total_count_price-"+num);
		   
			if(count > 1){
				count--;
				countEl.value = count;
				total_count_price.value = total_count_price.value - total_count.value;
			}
	   });
   }
   
   
</script>
</body>
</html>



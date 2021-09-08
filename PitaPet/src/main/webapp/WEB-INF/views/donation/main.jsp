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
</head>
<body>
<jsp:include page="/resources/header.jsp"></jsp:include>
	<div class="board-wrap">
		<page-category class="adopt-review" :name="'입양후기'"></page-category>
    	<router-view></router-view>
    </div>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#donaModalBtn">후원하기</button>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#checkModalBtn">후원내역 확인하기</button>

<!-- 후원하기 Modal 폼 -->
<div class="modal fade" id="donaModalBtn" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fw-bold">핏어펫(Pit a Pet)후원</h5>
      </div>
      <div class="modal-body">
        <form action="${pageContext.request.contextPath}/donation/payment.do" method="post" id="modalForm">
          <div class="mb-3">
            <label for="name" class="col-form-label">이름</label>
            <input type="text" class="form-control" name="name" value="${dto.name }" readonly/>
          </div>
          <div class="mb-3">
            <label for="phoneNum" class="col-form-label">휴대전화</label>
            <input type="tel" class="form-control" name="phoneNum" value="${dto.phoneNumber }" readonly />
          </div>
          <div class="mb-3">
            <label for="email" class="col-form-label">이메일</label>
            <input type="text" class="form-control" name="email" value="${dto.email }" readonly />
          </div>
          <div class="mb-3">
            <label for="addr" class="col-form-label">주소</label>
            <input type="text" class="form-control" name="addr" value="${dto.address }" readonly />
          </div>
          <fieldset>
             <div class="mb-3">후원금액 선택</div>
             <div class="form-check-inline">
               <input class="form-check-input" type="radio" name="donation" value=10000 />
               <label class="form-check-label" for="choose1"><strong>10,000</strong></label>
             </div>
             <div class="form-check-inline">   
               <input class="form-check-input" type="radio" name="donation" value=30000 />
               <label class="form-check-label" for="choose2"><strong>30,000</strong></label>
             </div>
             <div class="form-check-inline">    
               <input class="form-check-input" type="radio" name="donation" value=50000 />
               <label class="form-check-label" for="choose3"><strong>50,000</strong></label>
             </div>
             <div class="form-check-inline">   
               <input class="form-check-input" type="radio" name="donation" value=100000 />
               <label class="form-check-label" for="choose4"><strong>100,000</strong></label>
             </div>
          </fieldset>
          <br />
           <div class="mb-3">
            <label for="donation">후원금액 입력</label>
            <small class="form-text text-muted">원하시는 금액이 없으면 직접 입력해 주세요.</small>
            <input type="text" class="form-control" name="donation" />
           </div>
        </form>
      </div>
      <div class="modal-footer">
         <small class="form-text text-muted">여러분의 소중한 후원금은 한 생명에게 새로운 삶의 기회를 부여합니다.</small>
        <button type="submit" class="btn btn-primary" id="submitBtn">후원하기</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


<!-- 후원내역 확인하기 Modal 폼 --> 
<div class="modal fade" id="checkModalBtn" tabindex="-1" >
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">후원내역 확인</h5>
      </div>
      <div class="modal-body text-center">
        ${dto.id } 님, Pit a Pet 에 후원하신 총 금액은
      </div>
	  <mark class="text-center fs-3 fw-bold"> 
	  	${dto.donation } 원
	  </mark>
      <div class="mb-3 text-center">입니다.</div>
      <small class="text-center">후원자님의 소중한 후원금을 통해 양질의 치료를 가능하게 할 뿐 아니라,</small>
      <small class="text-center">새 가족을 찾는것에 큰 도움이 되었습니다.</small>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- 공유하기 api -->
<a id="create-kakao-link-btn" href="javascript:;">
  <img
    src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
  />
</a>

</body>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

   document.querySelector("#submitBtn").addEventListener("click", function(){
      document.querySelector("#modalForm").submit();
   });

   
   //공유하기 api
   Kakao.init('0f3977c154172c5dbafcb560e7e445ca')
   document.querySelector("#create-kakao-link-btn").addEventListener("click", function(){
	  Kakao.Link.sendCustom({
	  	 templateId: 60751  
	  });   
   });
   
   
     
</script>
</html>
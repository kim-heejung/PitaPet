<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/donation/main.jsp</title>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>

   <h3>자유후원</h3>
   <form action="test.do" method="post" id="ajaxForm">
      <div>
         <label for="name">이름</label>
         <input type="text" name="name" value="${dto.name }" />
      </div>
      <div>
         <label for="phoneNum">핸드폰 번호</label>
         <input type="text" name="phoneNum" value="${dto.phoneNumber }" />
      </div>
      <div>
         <label for="email">이메일</label>
         <input type="text" name="email" value="${dto.email }" />
      </div>
      <div>
         <label for="addr">주소</label>
         <input type="text" name="addr" value="${dto.address }" />
      </div>
      <div>
         <input type="radio" name="donationNull" value="" />
         <label for="choose0">선택안함</label>
      </div>
      <div>
         <input type="radio" name="donation" value=10000 />
         <label for="choose1">10,000</label>
      </div>
      <div>
         <input type="radio" name="donation" value=30000 />
         <label for="choose2">30,000</label>
      </div>
      <div>
         <input type="radio" name="donation" value=50000 />
         <label for="choose3">50,000</label>
      </div>
      <div>
         <input type="radio" name="donation" value=100000 />
         <label for="choose4">100,000</label>
      </div>
      <div>
         <label for="donation">직접입력</label>
         <input type="text" name="donation" placeholder="후원금액을 입력하세요" />
      </div>
      <button type="submit" id="submitBtn">후원하기 </button>
   </form>
   
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
   
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/shop/buy.jsp</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
<script>
buy();
	function buy(){
	   IMP.init('imp87576891');
	   IMP.request_pay({
	       pg : 'kakaopay',
	       pay_method : 'card',
	       merchant_uid : 'merchant_' + new Date().getTime(),
	       name : '${param.product}' , //결제창에서 보여질 이름
	       amount : ${param.price}, //실제 결제되는 가격
	       buyer_name : '${param.name}',
	       buyer_email : '${param.email}',
	       buyer_tel : '${param.phoneNum}',
	       buyer_postcode : '123-456',
	      buyer_addr : '${param.addr}'
	   }, function(rsp) {
	      console.log(rsp);
	       if ( rsp.success ) {
	          var msg = '결제가 완료되었습니다.';
	           msg += '결제 금액 : ' + rsp.paid_amount;
	           location.href="${pageContext.request.contextPath}/shop/list.do";
	       } else {
	           var msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	       }
	       alert(msg);
	   });
	}
</script>
</body>
</html>
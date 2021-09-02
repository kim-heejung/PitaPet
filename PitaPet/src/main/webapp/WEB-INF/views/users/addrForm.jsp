<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Users/addrForm</title>
</head>
<script language="javascript">
function init(){
	var url = location.href;
	var confmKey = "devU01TX0FVVEgyMDIxMDkwMjE4NTEzNjExMTYxNDc=";// 팝업API승인키
	var resultType = "4"; // 도로명주소 검색결과 화면 출력유형, 1 : 도로명, 2 : 도로명+지번+상세보기(관련지번, 관할주민센터), 3 : 도로명+상세보기(상세건물명), 4 : 도로명+지번+상세보기(관련지번, 관할주민센터, 상세건물명)
	var inputYn= "${inputYn}";
	if(inputYn != "Y"){
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.resultType.value = resultType; 
		document.form.action="https://www.juso.go.kr/addrlink/addrCoordUrl.do"; // 인터넷망
		document.form.submit();
	}else{
		/** API 서비스 제공항목 확대 (2017.02) **/
		opener.jusoCallBack("${roadFullAddr}","${entX}","${entY}");
		window.close();
	}
}
</script>

<body onload="init();">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="resultType" name="resultType" value=""/>
	</form>
</body>
</html>
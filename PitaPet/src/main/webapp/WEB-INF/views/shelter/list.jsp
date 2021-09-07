<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
	<%-- bootstrap 읽어오기 --%>
	<jsp:include page="/resources/resource.jsp"></jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />
</head>
<body>
<div id="shelterList">
	<header-component :cpath="cpath" :id="id"></header-component>
	<div class="board-wrap">
	<page-category :name="'보호소위치'"></page-category>
	<div class="container">
		<table class="table">
			<thead class="table-light">
				<tr>
					<th>이름</th>
					<th>주소</th>
					<th>위치 보기</th>
					<th>연락처</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list}">
					<tr>
						<td>
							<p id="name-${tmp.num }">${tmp.name }</p>
						</td>
						<td> 
							<p id="addr-${tmp.num }">${tmp.address }</p>
							<div id="map-${tmp.num }" name="map" style="display:none; width:100%; height:350px;"></div>
						</td>
						<td>
							<a href="#" onClick="searchMap(this);" data-num="${tmp.num }">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
									 <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
								</svg>
							</a>
						</td>
						<td>
							 <a href="tel:${tmp.phoneNumber }">${tmp.phoneNumber }</a>
						</td>
						<td>
							<a href="mailto:${tmp.email }">${tmp.email }</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
	<footer-component></footer-component>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/page_category.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f9167c13c297a00aaa16ef127e6ac76c&libraries=services"></script>
<script>
	const base_url="http://localhost:8888/spring";
	new Vue({
	    el : "#shelterList",
	    data:{
			cpath: "${pageContext.request.contextPath}",
			id: "${sessionScope.id}",
		   }
	  });
	
	function searchMap(e){
		const num=e.getAttribute("data-num");
		let addr=document.querySelector("#addr-"+num).innerText;
		let name=document.querySelector("#name-"+num).innerText;
		document.querySelector("#map-"+num).style.display="block";
		var mapContainer = document.getElementById('map-'+num), 
		mapOption = { 
		    center: new kakao.maps.LatLng(33.450701, 126.570667), 
		    level: 3 
		};
		
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		var geocoder = new kakao.maps.services.Geocoder();

		geocoder.addressSearch(addr, function(result, status) {

		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
		        });
		        infowindow.open(map, marker);

		        map.setCenter(coords);
		    } 
		});    
		
	}
</script>
</body>
</html>
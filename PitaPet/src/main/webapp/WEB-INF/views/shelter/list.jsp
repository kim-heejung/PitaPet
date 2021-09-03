<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shelter/list.jsp</title>
</head>
<body>
	<h1>보호소 둘러보기</h1>
		<table>
			<thead>
				<th>이름</th>
				<th>주소</th>
				<th>연락처</th>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list}">
					<tr>
						<td>${tmp.name }</td>
						<p id="name-${tmp.num }" style="display:none">${tmp.name }</p>
						<td> 
							<input type="button" onclick="searchMap(this)" data-num="${tmp.num }" value="${tmp.address }"/>
							<p id="addr-${tmp.num }" style="display:none">${tmp.address }</p>
							<div id="map-${tmp.num }" name="map" style="display:none; width:100%; height:350px;"></div>
						</td>
						<td>${tmp.phoneNumber }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f9167c13c297a00aaa16ef127e6ac76c&libraries=services"></script><script>

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
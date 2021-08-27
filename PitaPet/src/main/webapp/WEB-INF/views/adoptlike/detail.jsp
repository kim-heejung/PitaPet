<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pit a pet</title>
<body>

	<div>
		<c:choose>
			<c:when test="${isLike}">
				<li>
		        	<a data-num=" ${num} " href="javascript:" class="icon-link like-link">
		            	♥
		            	<span class="like-count"> ${likeCount} </span>
		            </a>
		    	</li>	
			</c:when>
			<c:otherwise>
				<li>
		        	<a data-num=" =num " href="javascript:" class="icon-link like-link">
		           		♡
		            	<span class="like-count"> ${likeCount} </span>
		        	</a>
		    	</li>
			</c:otherwise>
		</c:choose>
		
		
	</div>       				
</body>
</html>



















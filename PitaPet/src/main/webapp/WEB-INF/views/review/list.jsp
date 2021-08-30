<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<jsp:include page="/resources/resource.jsp"></jsp:include>
<style>
   .img-wrapper{
      height: 550px;
      transition: transform 0.3s ease-out;
   }
   
   .img-wrapper:hover{
      transform: scale(1.05);
   }
   
   .card .card-text{
      display:block;
      white-space : nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
   }
   
   .img-wrapper img{
     width: 100%;
     height: 100%;
     object-fit: contain;   
   }
</style>
</head>
<body>
<div id="reviewList">
	<div class="container" style="position:absolute; top:0; left:50%; transform:translateX(-50%);display:flex; align-items:center; justify-content:flex-end; height:44px;">
		<c:choose>
			<c:when test="${empty sessionScope.id }">
				<a href="${pageContext.request.contextPath}/users/loginform.do">로그인</a>
				<a href="${pageContext.request.contextPath}/users/signup_form.do">회원가입</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/users/info.do">${sessionScope.id }</a> 로그인 중..
				<a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
			</c:otherwise>
		</c:choose>
	</div>
	<header-component :cpath="cpath"></header-component>
	<div class="container">
	      <a href="${pageContext.request.contextPath}/review/private/insertform.do">추가하기</a><br/>
	      <div class="row">
	      	<div v-for="tmp in reviews" v-bind:key="tmp.num" class="col-2 col-md-5 col-lg-4">
	      		<div class="card mb-3">
	      			<a href="">
	      				<div class="img-wrapper">
                           <img class="card-img-top" :src="cpath + tmp.img" />
                        </div>
	      			</a>
	      			<div class="card-body">
	      				<p class="card-text">{{tmp.title}}</p>
                        <p class="card-text">by <strong>{{tmp.writer}}</strong></p>
                        <p><small>{{tmp.regdate}}</small></p>
	      			</div>
	      		</div>
	      	</div>
	      
	      
	      

	      
	      
	      
	      
	      </div>
	      <nav>
	   <ul class="pagination justify-content-center">
	      <c:choose>
	         <c:when test="${startPageNum ne 1 }">
	            <li class="page-item">
	                     <a class="page-link" href="${pageContext.request.contextPath}/review/list.do?pageNum=${startPageNum - 1}">Prev</a>
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
	                        <a class="page-link" href="${pageContext.request.contextPath}/review/list.do?pageNum=${i}">${i }</a>
	                     </li>
	            </c:when>
	            <c:otherwise>
	               <li class="page-item">
	                        <a class="page-link" href="${pageContext.request.contextPath}/review/list.do?pageNum=${i}">${i}</a>
	                     </li>
	            </c:otherwise>
	         </c:choose>
	      </c:forEach>
	      <c:choose>
	         <c:when test="${endPageNum lt totalPageCount }">
	            <li class="page-item">
	                     <a class="page-link" href="${pageContext.request.contextPath}/review/list.do?pageNum=${endPageNum + 1}">Next</a>
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
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script>
	const base_url="http://localhost:8888/spring";
	let reviewList = new Vue({
		el:"#reviewList",
		data(){
			return{
				cpath: "${pageContext.request.contextPath}",
				reviews: [],
				currentReviews: []
			}
		},
		created(){
			const self = this;
			axios.get("http://localhost:8888/spring/api/review/list.do")
			.then(function(response){
				if(response.status == 200){
					self.reviews = response.data;
					self.currentReviews = response.data;
				}
			})
			.catch(function(error){
				console.log(error);
			});
		}
	});
</script>
</body>
</html>


















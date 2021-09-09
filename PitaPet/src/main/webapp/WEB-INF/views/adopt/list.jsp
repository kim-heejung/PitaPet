<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
	<%-- bootstrap 읽어오기 --%>
	<jsp:include page="/resources/resource.jsp"></jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />
	<style>
		a:hover{ cursor:pointer; }
	</style>
</head>
<body>
<div id="adoptList">
      <header-component :cpath="cpath" :id="id"></header-component>
    <div class="board-wrap">
	    <page-category :cpath="cpath" :index="0"></page-category>
	    <div class="container">
		   	<a href="${pageContext.request.contextPath}/adopt/private/insertform.do" class="btn btn-primary">새글 작성</a><br/>
	   		<select v-model="selected" name="shelterName" id="shelter" @change="optionSelect">
	   			<option v-for="option in options" v-bind:value="option.value">{{ option.text }}</option>
			</select>
		   	<ul class="row">
		   		<li v-for="(tmp, index) in adoptList" class="col-6 col-md-4 col-lg-3" :key="index">
		   			<div class="card mb-3">
		   				<a href="${pageContext.request.contextPath}/adopt/detail.do?num=${tmp.num}&shelterName=${shelterName}">
		               		<div class="img-wrapper">
		                  		<img class="card-img-top" :src="cpath + tmp.imagePath" />
		               		</div>
		           		</a>
		           		<ul>
		           			<li class="card-text">
			           			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
								  <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
								</svg>
								<span>{{tmp.name}}</span>
							</li>
		           			<li class="card-text">{{tmp.title}}</li>
		           			<!--  <li class="card-text">by <strong>{{tmp.writer}}</strong></li> -->
		           			<li class="card-text">{{tmp.viewCount}}</li>
		           			<li class="card-text">{{tmp.regdate}}</li>
		           			<li class="card-text" >
		           				<div v-if="id == ''">
		           					<a v-on:click.prevent="message('로그인 후 이용 가능합니다')" href="">♥</a>
		          					<span>{{tmp.cnt}}</span>
		           				</div>
		           				<div v-else>
		           					<a v-if="tmp.liked == 'yes'" v-on:click.prevent="unlikeClick(tmp.num)" href="">♥</a>
			          				<a v-else v-on:click.prevent="isFirstLike(tmp.num)" href="">♡</a>
			          				<span>{{tmp.cnt}}</span>
		           				</div>
		           			</li>
		           		</ul>
		   			</div>
		   		</li>
		   	</ul>
		   	<nav class="pagination justify-content-center">
				<ul>
					<li class="page-item" v-if="startPageNum != 1">
						<a v-on:click.prevent="movePage(startPageNum-1)" class="page-link" href="">Prev</a>
					</li>
					<li class="page-item disabled" v-else>
			            <a class="page-link" href="javascript:">Prev</a>
			        </li>
			        <li v-for="i in pageNums" class="page-item" v-bind:class="{active: i == pageNum}">
		            	<a v-on:click.prevent="movePage(i)" class="page-link" href="">{{ i }}</a>
			        </li>
			        <li class="page-item" v-if="endPageNum < totalPageCount">
						<a v-on:click.prevent="movePage(endPageNum+1)" class="page-link" href="${pageContext.request.contextPath}/adopt/list.do?pageNum=${endPageNum + 1}">Next</a>
		            </li>
			        <li class="page-item disabled" v-else>
		                <a class="page-link" href="javascript:">Next</a>
			        </li>
				</ul>
			</nav>   	
	   </div>
	</div>
	<footer-component></footer-component>
    
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/page_category.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script>
 const base_url="http://localhost:8888/spring";
  new Vue({
      el : "#adoptList",
      data:{
		cpath: "${pageContext.request.contextPath}",
		id: "${sessionScope.id}",
		selected: 'all',
		options: [
			  { text: '전체', value: 'all' },
		      { text: '서울', value: 'seoul' },
		      { text: '인천', value: 'incheon' },
		      { text: '부산', value: 'busan' }
		],
		adoptList: [],
		pageNum:1,
		startPageNum:1,
		endPageNum:5,
		totalPageCount:0,
	   },
	   computed:{
			pageNums(){
				const nums = [];
				for(i = this.startPageNum; i<=this.endPageNum; i++){
					nums.push(i);
				}
				return nums;
			}
		},
	   methods:{
		   message(msg){
			   alert(msg);
		   },
		   optionSelect(){
			   this.makeList(this.selected); 
		   },
		   //로그인하지않았을때 리스트 출력할 메소드
		   makeList(area){
			   /*
				   if(area != undefined && area != 'all'){
					   console.log("무언가를 선택 했습니다");
				   }
			   */
			   
			   const self = this;
			   axios.get(base_url + "/api/adopt/list.do",{params:{
					pageNum:this.pageNum
				}})
				.then(function(response){
					console.log(response.data);
					if(response.status == 200){
						self.adoptList = response.data;
					}
				})
				.catch(function(error){
					console.log(error);
				});
			   axios.get(base_url + "/api/adopt/paging.do",{
					params:{
						pageNum:this.pageNum
					}
				})
				.then(function(response){
					if(response.status == 200){
						self.startPageNum = response.data.startPageNum;
						self.endPageNum = response.data.endPageNum;
						self.totalPageCount = response.data.totalPageCount;
					}
				})
				.catch(function(error){
					console.log(error);
				});
			   
			   
			   
			   
			   
			   
			   
			   
			   
			   
			   
		   },
		   unlikeClick(num){
			   const self = this;
			   axios({
				   method: "post",
				   url : base_url + "/api/adoptlike/unlike.do",
				   params:{ num }
			   })
			   .then(function(response){
				   
				})
				.catch(function(error){
					console.log(error);
				});
			   this.makeList();
		  		
		   },
		   isFirstLike(num){
			   const self = this;
			   //0.처음 클릭한것인지 얻어온다
			   axios.get(base_url + "/api/adoptlike/isexist.do", { params:{ num }} )
				.then(function(response){
					response.data == 1 ? self.updateLike(num) : self.insertLike(num);
				})
				.catch(function(error){
					console.log(error);
				});
		   },
		   insertLike(num){
			 //1.처음 클릭하는건() insert시킨다
			   const self = this;
			   axios({
				   method: "post",
				   url : base_url + "/api/adoptlike/insert.do",
				   params:{ num }
			   })
			   .then(function(response){
				})
				.catch(function(error){
					console.log(error);
				});
			   this.makeList();  
		   },
		   updateLike(num){
			 //2.두번째 클릭부터는 like한다
			   const self = this;
			   axios({
				   method: "post",
				   url : base_url + "/api/adoptlike/like.do",
				   params:{ num }
			   })
			   .then(function(response){
				})
				.catch(function(error){
					console.log(error);
				});
			   this.makeList();  
		   },
		   movePage(pageNum){
				//현재 페이지를 수정하고
				this.pageNum = pageNum;
				this.makeList();  
			}
	   },
	   created(){
		   this.makeList();
		}
    });
   function formChange(obj){
      //select box 선택 시 JSP페이지로 데이터를 전달
      
      //※obj 변수에는 form 객체가 저장되어 있다.
      //필요에 따라 전송하기 전에 검증 절차를 추가하는 것이 가능하다.
      
      obj.submit(); //obj자체가 form이다.
      //『폼객체.submit();』 함수의 호출을 통해
      //form 객체의 데이터를 서버로 전송하는 것이 가능하다.   
   }
</script>   

</body>
</html>




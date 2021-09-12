<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
	<jsp:include page="/resources/resource.jsp"></jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />
</head>
<body>
<div id="adoptList">
    <header-component :cpath="cpath" :id="id"></header-component>
    <div class="board-wrap">
	    <page-category :cpath="cpath" :index="0"></page-category>
	    <div class="container">
	    	<div class="btn-wrap btn-right">
		   		<a :href="cpath + '/adopt/private/insertform.do'" class="btn btn-s btn-black">새글 작성</a>
		   	</div>
		 	<div class="tab-btn">
                <button v-for="(tab, index) in tabs" style="margin-bottom:50px;"
                    :key="index"
                    :class="{active: currentTab == index}"
                    @click="currentTab = index">{{tab}}</button>
            </div>
		   	<div class="row tab-content">
		   		<div v-show="currentTab==0">
			   		<!-- <div class="sub-tab-btn">
			 			<a v-for="option in options"
			 				 :class="{on : selected == option.value}" 
			 				 href="" 
			 				 @click.prevent="filteredListDog(option.value, option.text)">{{ option.text }}</a>
		 			</div> -->
		   			<adopt-list :cpath="cpath" :adopt-animal="adoptDog"></adopt-list>
		   			<pagination-component :name="paginationDog" @page="setPageNum"></pagination-component>
		   		</div>
		   		<div v-show="currentTab==1">
			   		<!--<div class="sub-tab-btn">
			 			<a v-for="option in options"
			 				 :class="{on : selected == option.value}" 
			 				 href="" 
			 				 @click.prevent="filteredListCat(option.value, option.text)">{{ option.text }}</a>
			 		</div>-->
		   			<adopt-list :cpath="cpath" :adopt-animal="adoptCat"></adopt-list>
		   			<pagination-component :name="paginationCat" @page="setPageNum"></pagination-component>
		   		</div>
		   	</div>
	   </div>
	</div>
	<footer-component></footer-component>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vue-router/dist/vue-router.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/page_category.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/pagination.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script>
  const base_url="http://localhost:8888/spring";
  
  
  Vue.component("adopt-list", {
	  template:`
	  	<ul class="row">
		  <li v-for="(tmp, index) in adoptAnimal" class="col-6 col-md-4 col-lg-3" :key="index">
	 			<div class="card mb-3">
	 				<a :href="cpath + '/adopt/detail.do?num=' + tmp.num">
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
	         			<li class="card-text">{{tmp.viewCount}}</li>
	         			<li class="card-text">{{tmp.regdate}}</li>
	         		</ul>
	 			</div>
	 		</li>
 		</ul>
	  `,
	  props:["cpath", "adoptAnimal"]
  });
  

  
  new Vue({
      el : "#adoptList",
      data:{
		cpath: "${pageContext.request.contextPath}",
		id: "${sessionScope.id}",
		currentTab:0,
		tabs:["Dog", "Cat"],
		adoptDog:[],
		adoptCat:[],
		selected: 'all',
		options: [
			  { text: '전체', value: 'all' },
		      { text: '서울', value: 'seoul' },
		      { text: '인천', value: 'incheon' },
		      { text: '부산', value: 'busan' },
		      { text: '에이콘임시보호소', value: 'acorn' }
		],
		pageNum:1,
		paginationDog:"http://localhost:8888/spring/api/adopt/paging.do?pageNum=1&animalType=dog",
		paginationCat:"http://localhost:8888/spring/api/adopt/paging.do?pageNum=1&animalType=cat",
	   },
	   methods:{
		   /*
		   filteredListDog(value, area) {
			   this.selected = value;
			   const self = this;
			   axios.get(base_url + "/api/adopt/list.do",{
				   params:{ 
					   pageNum:this.pageNum,
					   animalType:'dog'
				   }
			   })
				.then(function(response){
					if(response.status == 200){
						let filters = response.data;
						self.adoptDog = filters.filter(item => area == "전체" ? true : item.name == area);
						self.$nextTick(function() {
							self.paginationDog = "http://localhost:8888/spring/api/adopt/paging.do?pageNum=1&animalType=dog";
					    })
						
					}
				})
				.catch(function(error){
					console.log(error);
				});
		   },
		   filteredListCat(value, area) {
			   this.selected = value;
			   const self = this;
			   axios.get(base_url + "/api/adopt/list.do",{
				   params:{ 
					   pageNum:this.pageNum,
					   animalType:'cat'
				   }
			   })
				.then(function(response){
					if(response.status == 200){
						let filters = response.data;
						self.adoptCat = filters.filter(item => area == "전체" ? true : item.name == area);
						self.pagination = "http://localhost:8888/spring/api/adopt/paging.do?pageNum=1&animalType=cat";
					}
				})
				.catch(function(error){
					console.log(error);
				});
		   },
		   */
		   message(msg){
			   alert(msg);
		   },
		   dogList(){
			   const self = this;
			   axios.get(base_url + "/api/adopt/list.do",{
				   params:{ 
					   pageNum:this.pageNum,
					   animalType:'dog'
				   }
			   })
				.then(function(response){
					console.log(response);
					if(response.status == 200){
						self.adoptDog = response.data;
					}
				})
				.catch(function(error){
					console.log(error);
				});
		   },
		   catList(){
			   const self = this;
			   axios.get(base_url + "/api/adopt/list.do",{
				   params:{ 
					   pageNum:this.pageNum,
					   animalType:'cat'
				   }
			   })
				.then(function(response){
					console.log(response);
					if(response.status == 200){
						self.adoptCat = response.data;
					}
				})
				.catch(function(error){
					console.log(error);
				});
		   },
		   setPageNum(pageNum){
			   this.pageNum = pageNum;
			   this.dogList();
			   this.catList();
		   },
	   },
	   created(){
		   this.dogList();
		   this.catList();
		}
    });
</script>   
</body>
</html>




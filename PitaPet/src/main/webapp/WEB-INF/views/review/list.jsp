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
<div id="reviewPage" >
	<jsp:include page="/resources/header.jsp"></jsp:include>
	<div class="board-wrap">
		<page-category :name="'입양후기'"></page-category>
    	<router-view></router-view>
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
	let reviewList = Vue.component("reviewList",{
		template:`
			<div class="container">
				<a href="${pageContext.request.contextPath}/review/private/insertform.do" class="btn btn-primary">추가하기</a><br/>
			    <div class="row">
			     	<div v-for="(tmp, index) in reviewList" v-bind:key="tmp.num" class="col-6 col-md-4 col-lg-3">
			     		<div class="card mb-3">
			     			<router-link :to="{name:'detail', query:{num: tmp.num}}">
			     				<div class="img-wrapper">
			                         <img class="card-img-top" :src="cpath + tmp.img" />
			                      </div>
	                        </router-link>
			     			<div class="card-body">
			     				<p class="card-text">{{tmp.title}}</p>
			                      <p class="card-text">by <strong>{{tmp.writer}}</strong></p>
			                      <p><small>{{tmp.regdate}}</small></p>
			     			</div>
			     		</div>
			     	</div>
			     </div>
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
							<a v-on:click.prevent="movePage(endPageNum+1)" class="page-link" href="${pageContext.request.contextPath}/review/list.do?pageNum=${endPageNum + 1}">Next</a>
			            </li>
				        <li class="page-item disabled" v-else>
			                <a class="page-link" href="javascript:">Next</a>
				        </li>
					</ul>
				</nav>
				<router-view></router-view>
			</div>
		`,
		data(){
			return{
				cpath: "${pageContext.request.contextPath}",
				reviewList: [],
				currentReviews: [],
				pageNum:1,
				startPageNum:1,
				endPageNum:5,
				totalPageCount:0,
			}
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
			showDetail(index){
				//bootstrap 모달 띄우기
				let modal = new bootstrap.Modal(document.querySelector("#detailModal"));
				modal.show();
			},
			updateUI(){
				//갤러리 목록을 다시 요청해서 받아온다
				const self = this;
				axios.get(base_url + "/api/review/list.do",{
					params:{
						pageNum:this.pageNum
					}
				})
				.then(function(response){
					if(response.status == 200){
						self.reviewList = response.data;
						self.currentReviews = response.data;
					}
				})
				.catch(function(error){
					console.log(error);
				});
				axios.get(base_url + "/api/review/paging.do",{
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
			movePage(pageNum){
				//현재 페이지를 수정하고
				this.pageNum = pageNum;
				this.updateUI();
			}
		},
		created(){
			this.updateUI();
		}
	});
	let detail = Vue.component("detail", {
        template:`
        	<div class="container">
        		<ul>
        			<li v-if="reviewDetail.prevNum != 0">
        				<a v-on:click.prevent="movePage(reviewDetail.prevNum)"  href="">이전글</a>
        			</li>
        			<li v-if="reviewDetail.nextNum != 0">
        				<a v-on:click.prevent="movePage(reviewDetail.nextNum)" href="">다음글</a>
        			</li>
        		</ul>
        		<table>
			  	      <tr>
			  	         <th>글번호</th>
			  	         <td>{{reviewDetail.num}}</td>
			  	      </tr>
			  	      <tr>
			  	         <th>작성자</th>
			  	         <td>{{reviewDetail.writer}}</td>
			  	      </tr>
			  	      <tr>
			  	         <th>제목</th>
			  	         <td>{{reviewDetail.title}}</td>
			  	      </tr>   
			  	      <tr>
			  	         <th>조회수</th>
			  	         <td>{{reviewDetail.viewCount }}</td>
			  	      </tr>
			  	      <tr>
			  	         <th>등록일</th>
			  	         <td>{{reviewDetail.regdate }}</td>
			  	      </tr>
			  	      <tr>
			  	         <td colspan="2">
			  	            <div class="content" v-html="reviewDetail.content"></div>
			  	         </td>
			  	      </tr>
		  	   </table>
			  	<ul>
			      <li><a href="list.do">목록보기</a></li>
			      <div v-if="id == reviewDetail.writer">
			         <li><a v-bind:href="'private/updateform.do?num=' + reviewDetail.num">수정</a></li>
			         <li><a v-bind:href="'private/delete.do?num=' + reviewDetail.num" >삭제</a></li>
		          </div>
			   </ul>
			</div>
        `,
        data(){
        	return{
        		id: "${sessionScope.id}",
        		query:null,
        		reviewDetail: {},
        	}
        },
        methods:{
        	updateUI(){
        		const self = this;
        		axios.get(base_url + "/api/review/detail.do",{
					params:{
						num:this.query
					}
				})
				.then(function(response){
					if(response.status == 200){
						self.reviewDetail = response.data;
						console.log(self.reviewDetail);
					}
				})
				.catch(function(error){
					console.log(error);
				});
        	},
        	movePage(num){
				//현재 페이지를 수정하고
				this.reviewDetail.num = num;
				this.query = num;
				this.updateUI();
			}
        },
        created(){
        	this.query = this.$route.query.num;
        	this.updateUI();
        }
    });
	let routes = [
	    {
	        path : "/",
	        component : reviewList,
	    },
	    {
	        path : "/detail",
	        name : "detail",
	        component : detail,
	    }
	];
	let router = new VueRouter({
        routes
    });
	let reviewPage = new Vue({
        router
    }).$mount("#reviewPage");

</script>
</body>
</html>


















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
	<header-component :cpath="cpath" :id="id"></header-component>
	<div class="board-wrap">
		<page-category class="adopt-review" :cpath="cpath" :index="1"></page-category>
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
				<a href="${pageContext.request.contextPath}/review/private/insertform.do" class="btn btn-primary">글쓰기</a><br/>
			    <div class="row">
			     	<div v-for="(tmp, index) in reviewList" v-bind:key="tmp.num" class="col-6 col-md-4 col-lg-3">
			     		<div class="card">
			     			<router-link :to="{name:'detail', query:{num: tmp.num}}">
			     				<div class="img-wrapper">
			                         <img class="card-img-top" :src="cpath + tmp.img" />
			                      </div>
	                        </router-link>
			     			<ul class="card-body">
			     				<li class="card-regdate">{{tmp.regdate}}</li>
			     				<li class="card-tit">{{tmp.title}}</li>
			                    <li class="card-txt">
			                    	<p v-html="trimHtml(tmp.content)"></p>
			                    </li>
			     			</ul>
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
			trimHtml(string){
				return string.replace(/(style=".+?")/gm, "").replace(/<(\/b|b)([^>]*)>/gi,"").replace(/<(\/img|img)([^>]*)>/gi,"").replace(/<(\/p|p)([^>]*)>/gi,"").replace(/&nbsp;/gi,"");
			},
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
	let comment = Vue.component("comment", {
		template:`
			<div>
				<form class="comment-form insert-form" method="post" @submit.prevent="postComment">
			      <input type="hidden" name="ref_group" v-model="num"/>
			      <input type="hidden" name="target_nick" v-model="writer"/>
			      <textarea name="content" v-model="content" v-html="id == '' ? '댓글 작성을 위해 로그인이 필요 합니다': '' "></textarea>
			      <button type="submit">등록</button>
			   </form>
			   <div class="comments">
			   	<ul>
			   		<li v-for="(tmp, index) in commentList" :key="index">
			   			<p v-if="tmp.deleted == 'yes'">삭제된 댓글 입니다</p>
			   			<div v-else :id="'reli' + tmp.num" :style="[tmp.num != tmp.comment_group ? {paddingLeft:'30px'} : {paddingLeft:'0px'}]">
				   			<svg v-if="tmp.num != tmp.comment_group" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
					   		  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
					   		</svg>
				   			 <dl>
		                        <dt>	
		                        	<div v-if="tmp.profile == null">
			                        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
								   		  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
								   		</svg>
		                        	</div>
		                        	<div v-else>
		                        		<img class="profile-image" :src="cpath + tmp.profile"/>
		                        	</div>
		                           <span>{{ tmp.id }}</span>
		                           <p v-if="tmp.num != tmp.comment_group">
		                           		@<i>{{ tmp.id }}</i>
		                           </p>
		                           <span>{{ tmp.regdate }}</span>
		                           <a data-num="tmp.num" href="javascript:" class="reply-link">답글</a>  
		                           <div v-if="id != 'null' && tmp.id == id">
		                           		<a data-num="tmp.num" class="update-link" href="javascript:">수정</a>
		                             	<a data-num="tmp.num" ref="delete-link" @click.prevent="addDeleteListener(tmp.ref_group)" href="javascript:">삭제</a>
		                           </div>
		                        </dt>
		                        <dd>
		                           <pre :id="'pre' + tmp.num">{{ tmp.content }}</pre>                  
		                        </dd>
		                     </dl>
	                     </div>
			   		</li>
			   	</ul>
			   </div>
			   
		    </div>
		`,
		props:["num", "writer"],
		data(){
        	return{
        		id: "${sessionScope.id}",
        		cpath: "${pageContext.request.contextPath}",
        		content:null,
        		commentList:[],
        		pageNum:1
        	}
        },
        mounted() {
        	
       	},
        methods:{
        	listComment(){
        		const self = this;
 			   axios.get(base_url + "/api/review/ajax_comment_list.do",{
				  params:{
 					  pageNum : this.pageNum,
 					  num : 182
 				   }
 			    })
 				.then(function(response){
 					console.log(response.data);
 					if(response.status == 200){
 						self.commentList = response.data;
 					}
 				})
        	},
        	postComment(){
        		axios({
 				   method: "post",
 				   url : base_url + "/api/review/comment_insert.do",
 				   params:{
 					  ref_group : this.num,
 					  content : this.content,
					  target_nick : this.writer
 				   }
 			   })
 			   .then(function(response){
 				   console.log(response);
 				})
 				.catch(function(error){
 					console.log(error);
 				});
        	},
        	addDeleteListener(num){
    	       const isDelete = confirm("댓글을 삭제 하시겠습니까?");
    	       if(isDelete){
    	    	   axios({
     				   method: "post",
     				   url : base_url + "/api/review/comment_delete.do",
     				   params:{
     					  ref_group : num,
     				   }
     			   })
    	    	   .then(function(response){
    	    		   console.log(response);
    	    		   /*
    	    		   if(data.isSuccess){
  	                      document.querySelector("#reli"+num).innerText="삭제된 댓글입니다.";
  	                   }
    	    		   */
	 				})
	 				.catch(function(error){
	 					console.log(error);
	 				}); 
       	    	}
        	}
        	
        },
        created(){
        	this.listComment();
        	
        }
	})
	let detail = Vue.component("detail", {
        template:`
        	<div class="detail-wrap container">
        		<ul>
        			<li class="detail_tit">{{reviewDetail.title}}</li>
        			<li class="detail_info">
        				<span>
        					{{reviewDetail.writer}}
        				</span>
        				<span>
		        			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
		        			  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
		        			  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
		        			</svg>
	        				{{reviewDetail.viewCount }}
        				</span>
        				<span>
		        			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
		        			  <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>
		        			  <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/>
		        			</svg>
	        				{{reviewDetail.regdate }}
        				</span>
        			</li>
        			<li class="detail_content">
        				<div class="content" v-html="reviewDetail.content"></div>
        			</li>
        		</ul>
			  	<ul class="detail-bottom">
			      	 <li><a href="list.do" class="btn btn-s">목록보기</a></li>
			         <li v-if="id == reviewDetail.writer"><a v-bind:href="'private/updateform.do?num=' + reviewDetail.num" class="btn btn-s">수정</a></li>
			         <li v-if="id == reviewDetail.writer"><a v-bind:href="'private/delete.do?num=' + reviewDetail.num" class="btn btn-s">삭제</a></li>
			   </ul>
			   <ul class="movePage-wrap">
		   			<li v-if="reviewDetail.prevNum != 0">
		   				<a v-on:click.prevent="movePage(reviewDetail.prevNum)"  href="">
			   				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
				   			  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
				   			</svg>&nbsp;
			   				이전글
		   				</a>
		   			</li>
		   			<li v-if="reviewDetail.nextNum != 0">
		   				<a v-on:click.prevent="movePage(reviewDetail.nextNum)" href="">
		   					다음글&nbsp;
		   					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
			   				  <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
			   				</svg>
		   				</a>
		   			</li>
		   		</ul>
		   		<comment :num="reviewDetail.num" :writer="reviewDetail.writer"></comment>
			</div>
        `,
        data(){
        	return{
        		id: "${sessionScope.id}",
        		cpath: "${pageContext.request.contextPath}",
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
        router,
        data:{
        	id: "${sessionScope.id}",
        	cpath: "${pageContext.request.contextPath}",
        }
    }).$mount("#reviewPage");

</script>
</body>
</html>


















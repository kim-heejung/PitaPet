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
<div id="reserveList">
	<header-component :cpath="cpath" :id="id"></header-component>
	<div class="board-wrap">
		<page-category class="reserve" :cpath="cpath" :index="5"></page-category>
		<div class="container">
			<div class="reserveContent">
				<p class="newContent"> <a class="newContentLink" :href="cpath + '/reserve/private/insertform.do'">예약하기</a> </p>
				<table class="reserveBoard">
					<thead>
						<tr class="boardRow">
							<th class="boardHeader">글번호</th>
							<th class="boardHeader">지점</th>
							<th class="boardHeader">제목</th>
							<th class="boardHeader">작성자</th>
							<th class="boardHeader">등록일</th>
							<th class="boardHeader">조회수</th>
							<th class="boardHeader">예약 확인</th>
						</tr>
					</thead>
					<tbody>
						<tr class="boardRow" v-for="(tmp, index) in reserveList">
							<td class="boardColumn">{{tmp.num}}</td>
							<td class="boardColumn">{{tmp.shelterName }}</td>
							<td class="boardColumn contentTitle">
								<a v-if="id == tmp.id" class="contentTitleLink" :href="cpath + '/reserve/detail.do?pageNum=${pageNum }&num=${tmp.num }'">
									{{ tmp.title }}
								</a>
								<a v-if="id != tmp.id && tmp.scope == 'private'" class="contentTitleLink" :href="cpath + '/reserve/detailcheckform.do?num=${tmp.num }'">
									{{tmp.title }}
								</a>
								<a v-if="id != tmp.id && tmp.scope != 'private'" class="contentTitleLink" :href="cpath + '/reserve/detail.do?pageNum=${pageNum }&num=${tmp.num }'">
									{{ tmp.title }}
								</a>
								<span v-for="(count, index) in allCount" v-if="tmp.num == count.ref_group"> ({{count.cnt }}) </span>
							</td>
							<td class="boardColumn">{{ tmp.writer }}</td>
							<td class="boardColumn">{{ tmp.regdate }}</td>
							<td class="boardColumn">{{ tmp.viewCount }}</td>
							<td class="boardColumn">
								<p v-if="tmp.checked == 'yes'" class="reserveCheck">예약 확인</p>
								<p v-else class="reserveChecking">예약 대기</p>
							</td>
						</tr>
					</tbody>
				</table>
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
						<a v-on:click.prevent="movePage(endPageNum+1)" class="page-link" :href="cpath + '/reserve/list.do?pageNum=${endPageNum + 1}'">Next</a>
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
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/page_category.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script>
	const base_url="http://localhost:8888/spring";
	new Vue({
	    el : "#reserveList",
	    data:{
			cpath: "${pageContext.request.contextPath}",
			id: "${sessionScope.id}",
			reserveList:[],
			allCount:[],
			pageNum:1,
			startPageNum:1,
			endPageNum:5,
			totalPageCount:0
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
			reserveData(){
				const self = this;
				axios.get(base_url + "/api/reserve/list.do",{
 					params:{
						pageNum:this.pageNum
					}
				})
 				.then(function(response){
 					console.log(response.data);
 					if(response.status == 200){
 						self.reserveList = response.data;
 					}
 				});
 				axios.get(base_url + "/api/reserve/paging.do",{
 					params:{
						pageNum:this.pageNum
					}
				})
				.then(function(response){
					console.log(response);
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
			listAllCount(){
				const self = this;
				axios.get(base_url + "/api/reserve/listallcount.do")
 				.then(function(response){
 					console.log(response.data);
 					if(response.status == 200){
 						self.allCount = response.data;
 					}
 				})
			},
			movePage(pageNum){
				console.log(pageNum);
				//현재 페이지를 수정하고
				this.pageNum = pageNum;
				this.reserveData();  
			}
		},
		created(){
			this.reserveData();
			this.listAllCount();
		}
	  });	
</script>
</body>
</html>























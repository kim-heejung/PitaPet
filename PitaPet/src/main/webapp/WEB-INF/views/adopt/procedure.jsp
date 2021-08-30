<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<jsp:include page="/resources/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/procedure.css" />
</head>
<body>
	<div id="procedure">
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
		<procedure-visual></procedure-visual>
		<div id="scroll-bg">
			<div class="bg" 
					v-for="(content, index) in content" 
					:key="index"
					ref="graphicElems"
					:style="{'filter': content.allFilter,
							'background-color': content.bgColor}">
				<div class="scene-img"
						:style="{'background-position': content.bgPosition,
								'backgorund-size': content.bgSize,
								'background-image': 'url(' + cpath +content.bgImg + ')'}"></div>
			</div>
		</div>
		<div class="scroll-text container">
			<div class="step" v-for="(content, index) in content" :key="index" ref="stepElems">
				<p class="step-tit" :style="{'color' : content.stepTitColor}">{{content.stepTit}}</p>
				<h2 class="main-tit" v-html="content.mainTit"></h2>
				<p class="main-txt" v-html="content.mainTxt"></p>
			</div>
		</div>
		<footer-component></footer-component>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/intro.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script>
	Vue.component("procedure-visual", {
		template:`
			<div style="position:relative; z-index:1; background: rgb(235, 211, 202); filter:grayscale(0.1) saturate(0.9);">
				<div class="first-txt">
					<h2 class="main-tit" v-html="this.tit"></h2>
					<p class="main-txt" v-html="this.txt"></p>
				</div>
				<div class="scoll-wrap">
					<div class="mouse"></div>
					<p class="mouse-txt">Scroll page!</p>
				</div>
			</div>
		`,
	    data(){
			return{
				tit:"동물을 입양한 당신이 자랑스럽습니다!<br>그 입양로 인해 한 생명의 세상이 달라질 거에요",
				txt:"개나 고양이를 키우고 싶다면 유기동물 보호시설에서 보호하고 있는 유기동물을 입양하는게 어떨까요?<br>원하는 동물을 새 식구로 맞이하는 것은 물론 한 생명을 구했다는 자부심으로 가슴이 뿌듯해집니다!<br><br>이곳 핏어팻(pit a pet)에서는 120마리의 길고양이들과 구조유기견들이 함께 지내고있습니다<br>입양 대상이 되는 동물들은 건강에 아무런 문제가 없으며,<br>사람을 잘 따르고 좋아하며, 입양간 가정에서 쉽게 적응할수 있는 동물들로<br>반려동물입양한다는 것은 평생 함께 할 새로운 가족을 들이는 일입니다<br> 핏어펫은 십수년과 유기동물 구조와 재입양의 경험을 바탕으로 가장 이상적이고<br>행복한 입양가정을 찾기 위해 최선의노력을 하고있습니다"
			}
		}
	});
	let procedure =new Vue({
		el:"#procedure",
		data(){
			return{
				step: null,
			    boundingRect: null,
				ioIndex: null,
				currentItem: null,
				graphicElems: [],
				stepElems: [],
				cpath: "${pageContext.request.contextPath}",
				content:[
					{
						allFilter:"grayscale(0.1) saturate(0.9)",
						bgImg:"/resources/images/precedure01.jpg",
						bgColor:"rgb(235 211 202)",
						bgSize:86,
						bgPosition:"center 100%",
						stepTit:"Check it",
						stepTitColor:"#ea7c54",
						mainTit:"입양 전 진지하게 점검해야 될 부분입니다<br/>입양한 동물에게 또 아픔을 주어선 안되겠죠..?",
						mainTxt:"반려동물을 맞이할 환경적 준비, 마음의 각오는 되어 있으신가요?<br/>개, 고양이는 10~15년 이상삽니다 결혼, 임신, 유학, 이사 등으로 가정환경이 바뀌어도<br/>한번 인연을 맺은 동물은 끝까지 책임지고 보살피겠다는 결심이 들으셨나요?<br/>모든 가족과의 합의는 되어 있으신가요?<br/>반려동물을 기른 경험이 있으신가요? 내가족이된 동물을 위해 공부할 각오가 되어 있으신가요?<br/>아플 때 적절한 치료를 해주고, 방치하시지 않으실건가요?<br/>입양으로 인한 경제적 부담을 짊어질 의사와 능력이 있으신가요?<br/>우리 집에서 키우는 다른 동물이 있다면 그동물들과 잘 어울릴 수 있을지 고민해보셨나요?<br/>성인이신가요? 미성년자에게는 반려동물을 분양하지않습니다 반드시 부모님과 함께 방문해주세요"
					},
					{
						allFilter:"brightness(1.2) saturate(0.6) grayscale(0.2)",
						bgImg:"/resources/images/precedure03.jpg",
						bgColor:"rgb(128 193 228)",
						bgSize:90,
						bgPosition:"right 120%",
						stepTit:"Visit here",
						stepTitColor:"#4d9ab0",
						mainTit:"미리 전화를 주시고<br/>일정을 조율해서 일정을 조율해 방문해 주세요!",
						mainTxt:"입양 신청자 본인이 직접 방문오셔야 합니다(대리인 방문 불가)"
					},
					{
						allFilter:"grayscale(0.1) saturate(0.85)",
						bgImg:"/resources/images/precedure04.jpg",
						bgColor:"#b7dfbd",
						bgSize:90,
						bgPosition:"left 130%",
						stepTit:"Write it",
						stepTitColor:"#60b56b",
						mainTit:"입양시 필요한 서류와 이동에 필요한<br/>케이지, 리드줄, 목걸이나 하네스 등을 챙겨 방문하셔서<br>입양계획서를 작성해주세요!",
						mainTxt:"신분증 혹은 신분증 복사본이 필요합니다<br/>유기견 입양절차 과정에서 책임분양비가 발생할수 있습니다"
					},
					{
						allFilter:"saturate(1)",
						bgImg:"/resources/images/precedure05.jpg",
						bgColor:"rgb(223 223 221)",
						bgSize:80,
						bgPosition:"center 110%",
						stepTit:"Remind it",
						stepTitColor:"#a0a08f",
						mainTit:"유기동물 입양시 반드시 기억해 주세요!<br/>유기동물들은 물건이 아닙니다!",
						mainTxt:"유기동물들은 이미 한번 버려진 아픔이 있는 동물들 입니다<br/>입양후 생활에서 과거의 트라우마로 고통받을 수 있으며,<br/>마음의 상처와 아픔을 보듬어 줄 수 있는지,<br/>충분히 케어할 수 있는 경제적인 여유가 되는지 등의 <br/>다양한 것들을 생각해 보셔야 합니다"
					},
				],	
			}
		},
		mounted(){
			this.$nextTick(function () {
				this.activate();
			});
			
			stepElems = this.$refs.stepElems;
			graphicElems = this.$refs.graphicElems;
		  	currentItem = graphicElems[0];
			  
		 	const io = new IntersectionObserver(entries, observer) => { ioIndex = entries[0].target.dataset.index * 1; };
		 	for (let i = 0; i < stepElems.length; i++) {
		 	    io.observe(stepElems[i]);
		 	    stepElems[i].dataset.index = i;
		 	    graphicElems[i].dataset.index = i;
		 	}
		},
		methods:{
			activate(action) {
			    currentItem.classList.add("visible");
			    if (action) actions[action](true);
			},
			inactivate(action) {
			    currentItem.classList.remove("visible");
			    if (action) actions[action](false);
			},
			handleScroll(){
			  let temp = 0;

			  for (let i = ioIndex - 1; i < ioIndex + 2; i++) {
			      step = stepElems[i];
			      if (!step) continue;
			      boundingRect = step.getBoundingClientRect();
			      temp++;

			      if (
			        boundingRect.top > window.innerHeight * 0.1 &&
			        boundingRect.top < window.innerHeight * 0.8
			      ) {
			        this.inactivate(currentItem.dataset.action);
			        currentItem = graphicElems[step.dataset.index];
			        this.activate(currentItem.dataset.action);
			      }
			    }
			}
		},
		created(){
			window.addEventListener("scroll", this.handleScroll);
			setTimeout(() => { scrollTo(0, 0); }, 100);
		}
	});
</script>
</html>
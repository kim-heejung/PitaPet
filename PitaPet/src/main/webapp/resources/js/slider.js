Vue.component("slider-component", {
    template:`
    	<div id="main" 
	        class="wrapper" 
	        v-cloak 
	        v-bind:class="{'is-previous': isPreviousSlide, 'first-load': isFirstLoad}">
    		<div id="slide-time" class="btns_num en_gill_400">
                <div class="btns_num_box"
                     :class="{ paused : isPlay }">
                    <a href="javascript:;" ref="btns_num_box"
                        v-for="(slide, index) in slides"
                        :key="index"
                        :class="{ on: index === currentSlide }"
                        @click="updateSlide(index)">0{{index + 1}}</a>
                </div>
                <a href="javascript:;" 
                    class="btn_playStop ir_text"
                    :class="{ on : isPlay }"
                    @click="isPlay = !isPlay"">슬라이드 일시정지</a>
            </div>
    		 <div class="btns_viewmore">
                 <div class="btns_arrow">
                    <a href="javascript:void(0);" 
                        class="btn_next gu_btn_arrow" 
                        ref="btn_next"
                        data-pos="r" 
                        style="transform: matrix(1, 0, 0, 1, 0, 0);"
                        @mouseover="doMouseOver" 
                        @mousemove="doMouseMove" 
                        @click="nextSlide()">
                        <svg class="svg_circle">
                            <circle cx="50%" cy="50%" r="45%" stroke-dasharray="160" stroke-dashoffset="160"></circle>
                        </svg>
                        <img :src="nextBtn" alt="다음보기">
                    </a>
                    <a href="javascript:void(0);" 
                        class="btn_prev gu_btn_arrow"
                        ref="btn_prev"
                        data-pos="l" 
                        style="transform: matrix(1, 0, 0, 1, 0, 0);"
                        @mouseover="doMouseOver"  
                        @mousemove="doMouseMove" 
                        @click="previousSlide()">
                        <svg class="svg_circle">
                            <circle cx="50%" cy="50%" r="45%" stroke-dasharray="160" stroke-dashoffset="160"></circle>
                        </svg>
                        <img :src="prevBtn" alt="이전보기">
                    </a>
                </div>
            </div>
		     <div class="slide-wrapper" 
		                v-for="(slide, index) in slides" 
		                :key="index"
		                :class="{ active: index === currentSlide }"
		                :style="{ 'z-index': (slides.length - index)}">
	            <div class="slide-average" :style="{ 'background-color' : slide.bgColor }"></div>
	            <div class="slide-image-left" :style="{'background-image': 'url(' + cpath +slide.bgImg + ')'}"></div>
	            <div class="slide-image-right" :style="{'background-image': 'url(' + cpath +slide.bgImg + ')'}"></div>
	            <div class="slide-inner">
	                <div class="slide-bg-text">
	                    <p>{{ slide.headlineFirstLine }}</p>
	                    <p>{{ slide.headlineSecondLine }}</p>
	                </div>
	                <div class="slide-rect-filter">
	                	<p class="circTxt" ref="circTxt" v-html="circle[index]"></p>
	                    <div class="slide-rect" :style="{'background-image': 'url(' + cpath + slide.rectImg + ')'}"></div>
	                </div>
	                <div class="slide-content">
	                    <h1 class="slide-content-text">
	                        <p>{{ slide.headlineFirstLine }}</p>
	                        <p>{{ slide.headlineSecondLine }}</p>
	                        <a class="slide-btn" href="">view more</a>
	                    </h1>
	                </div>
	                <h2 class="slide-side-text">
	                    <span>{{ slide.sublineFirstLine }} / </span>
	                    <span>{{ slide.sublineSecondLine }}</span>
	                </h2>
	            </div>
	        </div>
	        <div class="controls-container">
	        <button class="controls-button" 
	                v-for="(slide, index) in slides" 
	                :key="index"
	                :class="{ active: index === currentSlide }"
	                @click="updateSlide(index)"
	                :style="index === currentSlide ? {background : slide.bgColor} : {background : 'rgba(208, 206, 204, 0.32)'}"
	                >{{ slide.slideBtnTxt }}</button>
	        </div>
	        <div class="pagination-container">
	        <span class="pagination-item"
	                v-for="(slide, index) in slides" 
	                :key="index"
	                :class="{ active: index === currentSlide }"
	                @click="updateSlide(index)"></span>
	        </div>
        </div>
    `,
    props:["cpath"],
    data(){
        return{
        	circle: [],
            currentSlide: 0,
            isPreviousSlide: false,
            isFirstLoad: true,
            currentX: 0,
            currentY: 0,
            isPause: false,
            slideTimer: null,
            slideInterval: null,
            isPlay:false,
            nextBtn: "https://www.shinsegae.com/resources/site/img/common/btn_arrow_next_white.png",
            prevBtn: "https://www.shinsegae.com/resources/site/img/common/btn_arrow_prev_white.png",
            slides: [
                {
                    headlineFirstLine: "Adopt Animals, Adopt Family",
                    headlineSecondLine: "새로운 문화를 만듭니다 ",
                    sublineFirstLine: "Adopt Animals, Adopt Family",
                    sublineSecondLine: "Adopt Animals, Adopt Family",
                    circlelineFirstLine: "Adopt Animals, Adopt Family",
                    slideBtnTxt:"새로운 문화를 만듭니다",
                    bgImg: "/resources/images/main-slide01.jpg",
                    bgColor: "#a369e0",
                    rectImg: "/resources/images/main-slide01.jpg"
                    
                },
                {
                    headlineFirstLine: "Pit a Pet를 통해 68,725마리의",
                    headlineSecondLine: "유기동물이 가족을 찾았습니다",
                    sublineFirstLine: "사지 않고 입양하는 문화를 만듭니",
                    sublineSecondLine: "good pet",
                    circlelineFirstLine: "Adopt Animals, Adopt Family",
                    slideBtnTxt:"입양하는 문화",
                    bgImg: "/resources/images/main-slide02.jpg",
                    bgColor: "#f0ad48",
                    rectImg: "/resources/images/main-slide02.jpg"
                },
                {
                    headlineFirstLine: "Pit a Pet",
                    headlineSecondLine: "입양 후기를 만나보세요",
                    sublineFirstLine: "사지 않고 입양하는 문화를 만듭니",
                    sublineSecondLine: "good pet",
                    circlelineFirstLine: "Adopt Animals, Adopt Family",
                    slideBtnTxt:"입양하는 문화",
                    bgImg: "/resources/images/main-slide03.jpg",
                    bgColor: "#aaa",
                    rectImg: "/resources/images/main-slide03.jpg"
                }
            ]
        }
    },
    mounted: function () {
    	let productRotatorSlide = document.getElementById("main");
        let startX = 0;
        let endX = 0;

        productRotatorSlide.addEventListener("touchstart", (event) => startX = event.touches[0].pageX);
        productRotatorSlide.addEventListener("touchmove", (event) => endX = event.touches[0].pageX);
        productRotatorSlide.addEventListener("touchend", function(event) {
            let threshold = startX - endX;

            if (threshold < 150 && 0 < this.currentSlide) {
                this.currentSlide--;
            }
            if (threshold > -150 && this.currentSlide < this.slides.length - 1) {
                this.currentSlide++;
            }
        }.bind(this));
        
        
        this.circularText(this.slides[0].circlelineFirstLine, 70, 0);
        this.circularText(this.slides[1].circlelineFirstLine, 70, 0);
        this.circularText(this.slides[2].circlelineFirstLine, 70, 0);
    },
    methods: {
        previousSlide(){
            this.currentSlide == 0 ? this.currentSlide = this.slides.length-1 : this.currentSlide = this.currentSlide-1;
            this.isFirstLoad = false;
        },
        nextSlide(){
            this.currentSlide == this.slides.length-1 ? this.currentSlide = 0 : this.currentSlide = this.currentSlide + 1;
            this.isFirstLoad = false;
        },
        updateSlide(index) {
            index < this.currentSlide ? this.isPreviousSlide = true : this.isPreviousSlide = false;
            this.currentSlide = index;
            this.isFirstLoad = false;

            // let btn = document.querySelectorAll(".controls-button.active");
            // console.log(btn[index]);
            // btn[index].style.background = this.slides[index].bgColor;

        },
        circularText(txt, radius, classIndex) {
            txt = txt.split(""),
                classIndex = document.getElementsByClassName("circTxt")[classIndex];
            let deg = 360 / txt.length,
                origin = 0;

            txt.forEach((ea) => {
                ea = `<p style='height:${radius}px;position:absolute;top:0;left:0;transform:rotate(${origin}deg);transform-origin:0 100%'>${ea}</p>`;
                classIndex.innerHTML += ea;
                origin += deg;
            });
            
            this.circle.push(classIndex.innerHTML);
        },
        doMouseOver(e){
            this.currentX = e.clientX;
            this.currentY = e.clientY;
        },
        doMouseMove(e){
            let width = this.$refs.btn_next.offsetWidth;
            let height = this.$refs.btn_next.offsetHeight;
            let xx = e.clientX; 
            let yy = e.clientY;
           //this.$refs.btn_next.style.transform = `translate3d(${xx- this.currentX + (width/2)}px, ${yy- this.currentY - (height/2)}px, 0)`;   
        },
        doSlide(){
            let btns = this.$refs.btns_num_box;
            this.currentSlide == this.slides.length-1 ? this.currentSlide = 0 : this.currentSlide = this.currentSlide + 1;
            btns[this.currentSlide].classList = "";
            btns[this.currentSlide].classList = "on";
            this.updateSlide(this.currentSlide);
        },
        doSlideTime(){
            if(!this.isPause) this.slideTimer = setTimeout(this.doSlide, 5000);
        },
        dontSlide(){
            clearInterval(this.slideInterval);
            clearTimeout(this.slideTimer);
            this.isPause = true;
        },
        slideToggle(){

        }
    },
    created(){
    	
        //자동슬라이드 시작!
        //this.isPause = false;
        //this.slideInterval = setInterval(this.doSlideTime, 5000);
        
    }
});






Vue.component("pagination-component", {
    template:`
    	<nav class="pagination justify-content-center">
			<ul>
				<li class="arrow page-item"  v-if="startPageNum != 1">
					<a v-on:click.prevent="movePage(startPageNum-1)" class="page-link" href="" style="transform: matrix(1, 0, 0, 1, 0, 0);">
						<svg class="svg_circle">
                            <circle cx="50%" cy="50%" r="45%" stroke-dasharray="160" stroke-dashoffset="160"></circle>
                        </svg>
                        <img :src="prevBtn" alt="다음보기">
					</a>
				</li>
				<li class="arrow page-item disabled"  v-else>
					<a class="page-link" href="javascript:void(0);">
						<svg class="svg_circle">
                            <circle cx="50%" cy="50%" r="45%" stroke-dasharray="160" stroke-dashoffset="160"></circle>
                        </svg>
                        <img :src="prevBtn" alt="다음보기">
					</a>
				</li>
		        <li v-for="i in pageNums" class="page-item" v-bind:class="{active: i == pageNum}">
	            	<a v-on:click.prevent="movePage(i)" class="page-link" href="">{{ i }}</a>
		        </li>
		        <li class="arrow page-item" v-if="endPageNum < totalPageCount">
					<a v-on:click.prevent="movePage(endPageNum+1)" class="page-link" href="" style="transform: matrix(1, 0, 0, 1, 0, 0);">
						<svg class="svg_circle">
                            <circle cx="50%" cy="50%" r="45%" stroke-dasharray="160" stroke-dashoffset="160"></circle>
                        </svg>
                        <img :src="nextBtn" alt="다음보기">
					</a>
	            </li>
	            <li class="arrow page-item disabled" v-else>
					<a class="page-link" href="javascript:void(0);">
						<svg class="svg_circle">
                            <circle cx="50%" cy="50%" r="45%" stroke-dasharray="160" stroke-dashoffset="160"></circle>
                        </svg>
                        <img :src="nextBtn" alt="다음보기">
					</a>
	            </li>
			</ul>
		</nav>
    `,
    props:["name"],
    data(){
    	return{
    		pageNum:1,
    		startPageNum:1,
    		endPageNum:5,
    		totalPageCount:0,
    		nextBtn: "https://www.shinsegae.com/resources/site/img/common/btn_arrow_next_black.png",
            prevBtn: "https://www.shinsegae.com/resources/site/img/common/btn_arrow_prev_black.png",
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
    methods: {
    	pageUpdate(){
    		const self = this;
    		axios.get(self.name,{
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
			this.pageNum = pageNum;
			this.pageUpdate();;
			this.$emit("page", this.pageNum);
		}
    },
    created(){
    	this.pageUpdate();
    }
});
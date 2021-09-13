Vue.component("review-component-gallery", {
    template:`
	      <ul class="gallery_wrap row">
              <li v-for="(pet, index) in reviewAnimal" :key="index"
                  class="gallery_list col-6 col-xl-3">
                  <div class="gallery-thumnail">
                  	<img :src="cpath + pet.img">
              	  </div>
                  <div class="gallery-txt">
                  	  <p class="gallery-type">{{pet.animalType}}</p>
                      <h3 class="gallery-tit">{{pet.title}}</h3>
                      <p class="gallery-cont" v-html="trimHtml(pet.content)"></p>
                      <a class="gallery-btn" :href="cpath + '/review/list.do#/detail?num=' + pet.num">
                      	<span>more</span>
                      	<img src="https://www.shinsegae.com/resources/site/img/main/ico_hotnew_more.png">
                      </a>
                  </div>
              </li>
         </ul>
    `,
    props:["cpath", "reviewAnimal"],
    methods:{
    	trimHtml(string){
			return string.replace(/(style=".+?")/gm, "").replace(/<(\/b|b)([^>]*)>/gi,"").replace(/<(\/img|img)([^>]*)>/gi,"").replace(/<(\/p|p)([^>]*)>/gi,"").replace(/&nbsp;/gi,"");
		},
    }
});

Vue.component("review-component", {
    template:`
		  <div id="AdoptReview-wrap">
		      <div id="AdoptReview" class="container"> 
			        <div class="tit_area">
			            <h1 class="main_tit">Adopt Revie</h1>
			            <p class="main_txt">가족이 된 아이들을 자랑해주세요</p>
			        </div>
			        <div class="reviewTabs">
			            <div class="tab-btn">
			                    <button v-for="(tab, index) in tabs" 
			                        :key="index"
			                        :class="{active: currentTab == index}"
			                        @click="currentTab = index">{{tab}}</button>
			            </div>
			            <div class="tab-content">
			                <div v-show="currentTab==0">
			                	<review-component-gallery :cpath="cpath" :reviewAnimal="reviewDog" ></review-component-gallery>
		                	</div>
			                <div v-show="currentTab==1">
			                	<review-component-gallery :cpath="cpath" :reviewAnimal="reviewCat" ></review-component-gallery>
		                	</div>
			            </div>
			        </div>
			        <div class="btn-wrap">
			            <a :href="cpath + '/review/list.do#/'" class="view_btn">view more</a>
			        </div>
			  </div>
		  </div>
    `,
    props:["cpath"],
    data(){
  	  return{
  		currentTab:0,
		tabs:["Dog", "Cat"],
	    reviewDog:[],
	    reviewCat:[]
  	  }
    },
    methods:{
    	
    	reviewDogs(){
  		  const self = this;
  		  axios.get(base_url + "/api/review/mainlist.do", {
  			params:{
  				animalType:"dog"
				}
	  		  })
			.then(function(response){
				console.log(response.data);
				if(response.status == 200){ self.reviewDog = response.data; }
		     })
  	   },
  	   reviewCats(){
		const self = this;
 		  axios.get(base_url + "/api/review/mainlist.do", {
 			params:{
 				animalType:"cat"
			}
  		  })
		.then(function(response){
			console.log(response.data);
			if(response.status == 200){ self.reviewCat = response.data; } 
		  })
    	
  	   }
    	
    	
  	  	
    },
    created(){
    	this.reviewDogs();
    	this.reviewCats();
    }
});




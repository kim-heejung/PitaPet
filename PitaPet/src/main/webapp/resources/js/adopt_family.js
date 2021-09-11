const base_url="http://localhost:8888/spring";
Vue.component("family-component", {
      template:`
	     <div id="AdoptFamily" class="container">
	        <div class="tit-area">
	            <h1 class="main-tit">Adopt animals, Adopt Family</h1>
	            <p class="main-txt">사랑스러운 아이들이 기다리고있어요♥ 가족이 되어주세요</p>
	        </div>
	        <div class="grid-wrap row">
	            <family-component-gallery class="grid-left col-12 col-md-4" :family="newAdoptAnimals" :type="1"></family-component-gallery>
	            <family-component-gallery class="grid-right row col-12 col-md-8" :family="adoptAnimals" :type="2"></family-component-gallery>
	        </div>
	    </div>
      `,
      data(){
    	  return{
    		  newAdoptAnimals:[],
              adoptAnimals:[]
    	  }
      },
      methods:{
    	  birthdata(){
    		  const self = this;
    		  axios.get(base_url + "/api/adopt/birthdata.do")
 				.then(function(response){
 					console.log(response.data);
 					if(response.status == 200){
 						self.newAdoptAnimals.push(response.data);
 					}
 				})
    	  },
    	  birthlist(){
    		  const self = this;
    		  axios.get(base_url + "/api/adopt/birthlist.do")
 				.then(function(response){
 					console.log(response.data);
 					if(response.status == 200){
 						self.adoptAnimals = response.data;
 					}
 				})
    	  }
      },
      created(){
    	  this.birthdata();
    	  this.birthlist();
      }
});

Vue.component("family-component-gallery", {
    template:`
	      <ul>
            <li class="gallery-wrap col-12" 
            	:class="[type == 1 ? 'col-md-12' : 'col-md-6 col-xl-4']"
            	v-for="(adopt, index) in family" 
            	:key="index">
                <div class="gallery-thumb"></div>
                <div class="txt-wrap">
                    <slot></slot>
                    <p>
                    	<span v-if="type == 1" class="new-stemp">새가족</span>
                        <span class="location-stemp">{{ adopt.name }}</span>
                    </p>
                    <p class="adopt-tit">{{ adopt.title }}</p>
                    <ul class="adopt-txt">
                        <li>품종 - {{ adopt.breed }}</li>
                        <li>나이 - {{ adopt.petAge }}</li>
                        <li>성별 - {{ adopt.petGender }}</li>
                    </ul>
                </div>
            </li> 
        </ul>
    `,
    props:["family", "type"]
});






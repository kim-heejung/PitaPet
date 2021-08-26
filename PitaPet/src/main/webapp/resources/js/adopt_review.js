Vue.component("review-component-gallery", {
    template:`
	      <ul class="gallery_wrap">
              <li v-for="(pet, index) in reviewAnimal" :key="index"
                  class="gallery_list"
                  v-bind:style="{'background-image': 'url(' + pet.reviewThumbnail + ')'}">
                  <div class="gallery-txt">
                      <h3 class="gallery-tit">{{pet.reviewTit}}</h3>
                      <p class="gallery-cont">{{pet.reviewTxt}}</p>
                      <a class="btn" href="">more</a>
                  </div>
              </li>
         </ul>
    `,
    props:["reviewAnimal"]
});

Vue.component("review-component", {
    template:`
	      <div id="AdoptReview"> 
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
		                	<review-component-gallery :reviewAnimal="reviewDog" ></review-component-gallery>
	                	</div>
		                <div v-show="currentTab==1">
		                	<review-component-gallery :reviewAnimal="reviewCat" ></review-component-gallery>
	                	</div>
		            </div>
		        </div>
		        <div class="btn-wrap">
		            <a href="" class="view_btn">view more</a>
		        </div>
		  </div>
    `,
    data(){
  	  return{
  		currentTab:0,
		tabs:["Dog", "Cat"],
	    reviewDog:[
	        {   
	            reviewThumbnail : "http://daengtopia.com/file_data/daengtopia//2021/04/08/2d79bdb0d182ac12d37439660b49da1e.jpg",
	            reviewTit : "우리집 막내 달콤이",
	            reviewTxt : "두번째 글을 쓰네요!! 우리 현 두부 전 해탈이~ 성장!! 벌써 두부가 저희 집에 온지 1달이 훌쩍 넘었어요~아주아주 말썽이지만",
	        },
	        {   
	            reviewThumbnail : "http://daengtopia.com/file_data/daengtopia//2021/04/08/2d79bdb0d182ac12d37439660b49da1e.jpg",
	            reviewTit : "해탈이에서 두부로",
	            reviewTxt : "두번째 글을 쓰네요!! 우리 현 두부 전 해탈이~ 성장!! 벌써 두부가 저희 집에 온지 1달이 훌쩍 넘었어요~아주아주 말썽이지만",
	        },
	        {   
	            reviewThumbnail : "http://daengtopia.com/file_data/daengtopia//2021/06/28/192b818e2c0db5f1c81112d0500ee0a7.jpg",
	            reviewTit : "콩떡이 자랑하러 왔어요",
	            reviewTxt : "두번째 글을 쓰네요!! 우리 현 두부 전 해탈이~ 성장!! 벌써 두부가 저희 집에 온지 1달이 훌쩍 넘었어요~아주아주 말썽이지만",
	        },
	        {   
	            reviewThumbnail : "http://daengtopia.com/file_data/daengtopia//2021/06/09/66d66d9b3b2bcce91a624444f68523c0.jpg",
	            reviewTit : "해탈이에서 두부로",
	            reviewTxt : "두번째 글을 쓰네요!! 우리 현 두부 전 해탈이~ 성장!! 벌써 두부가 저희 집에 온지 1달이 훌쩍 넘었어요~아주아주 말썽이지만",
	        },
	        {   
	            reviewThumbnail : "http://daengtopia.com/file_data/daengtopia//2021/06/13/3f6bc6621bc2aa203ff885dadb502f14.jpg",
	            reviewTit : "해탈이에서 두부로",
	            reviewTxt : "두번째 글을 쓰네요!! 우리 현 두부 전 해탈이~ 성장!! 벌써 두부가 저희 집에 온지 1달이 훌쩍 넘었어요~아주아주 말썽이지만",
	        },
	        {   
	            reviewThumbnail : "http://daengtopia.com/file_data/daengtopia//2021/06/28/192b818e2c0db5f1c81112d0500ee0a7.jpg",
	            reviewTit : "맛있게 우족먹고 뻗은 망고",
	            reviewTxt : "두번째 글을 쓰네요!! 우리 현 두부 전 해탈이~ 성장!! 벌써 두부가 저희 집에 온지 1달이 훌쩍 넘었어요~아주아주 말썽이지만",
	        },
	        {   
	            reviewThumbnail : "http://daengtopia.com/file_data/daengtopia//2021/04/08/2d79bdb0d182ac12d37439660b49da1e.jpg",
	            reviewTit : "해탈이에서 두부로",
	            reviewTxt : "두번째 글을 쓰네요!! 우리 현 두부 전 해탈이~ 성장!! 벌써 두부가 저희 집에 온지 1달이 훌쩍 넘었어요~아주아주 말썽이지만",
	        },
	        {   
	            reviewThumbnail : "http://daengtopia.com/file_data/daengtopia//2021/04/08/2d79bdb0d182ac12d37439660b49da1e.jpg",
	            reviewTit : "안녕하세요 달콤이에요",
	            reviewTxt : "두번째 글을 쓰네요!! 우리 현 두부 전 해탈이~ 성장!! 벌써 두부가 저희 집에 온지 1달이 훌쩍 넘었어요~아주아주 말썽이지만",
	        }
	    ],
	    reviewCat:[
	        {   
	            reviewThumbnail : "http://daengtopia.com/file_data/daengtopia//2021/05/25/65fa30d111115d103384611939325295.jpg",
	            reviewTit : "자네는 어디까지 즐겨봤니?",
	            reviewTxt : "두번째 글을 쓰네요!! 우리 현 두부 전 해탈이~ 성장!! 벌써 두부가 저희 집에 온지 1달이 훌쩍 넘었어요~아주아주 말썽이지만",
	        },
	        {   
	            reviewThumbnail : "http://daengtopia.com/file_data/daengtopia//2021/05/25/65fa30d111115d103384611939325295.jpg",
	            reviewTit : "200일이에요",
	            reviewTxt : "두번째 글을 쓰네요!! 우리 현 두부 전 해탈이~ 성장!! 벌써 두부가 저희 집에 온지 1달이 훌쩍 넘었어요~아주아주 말썽이지만",
	        },
	        {   
	            reviewThumbnail : "http://daengtopia.com/file_data/daengtopia//2021/03/07/63f965928dfc0e805145b52157264bbd.jpg",
	            reviewTit : "해탈이에서 두부로",
	            reviewTxt : "두번째 글을 쓰네요!! 우리 현 두부 전 해탈이~ 성장!! 벌써 두부가 저희 집에 온지 1달이 훌쩍 넘었어요~아주아주 말썽이지만",
	        }
	        ,
	        {   
	            reviewThumbnail : "http://daengtopia.com/file_data/daengtopia//2021/05/25/65fa30d111115d103384611939325295.jpg",
	            reviewTit : "빵떡이가 가족이 되었어요!",
	            reviewTxt : "두번째 글을 쓰네요!! 우리 현 두부 전 해탈이~ 성장!! 벌써 두부가 저희 집에 온지 1달이 훌쩍 넘었어요~아주아주 말썽이지만",
	        },
	        {   
	            reviewThumbnail : "http://daengtopia.com/file_data/daengtopia//2021/05/25/65fa30d111115d103384611939325295.jpg",
	            reviewTit : "콜라 잘 크고 있어요",
	            reviewTxt : "두번째 글을 쓰네요!! 우리 현 두부 전 해탈이~ 성장!! 벌써 두부가 저희 집에 온지 1달이 훌쩍 넘었어요~아주아주 말썽이지만",
	        },
	        {   
	            reviewThumbnail : "http://daengtopia.com/file_data/daengtopia//2021/05/25/65fa30d111115d103384611939325295.jpg",
	            reviewTit : "해탈이에서 두부로",
	            reviewTxt : "두번째 글을 쓰네요!! 우리 현 두부 전 해탈이~ 성장!! 벌써 두부가 저희 집에 온지 1달이 훌쩍 넘었어요~아주아주 말썽이지만",
	        },
	        {   
	            reviewThumbnail : "http://daengtopia.com/file_data/daengtopia//2021/05/25/65fa30d111115d103384611939325295.jpg",
	            reviewTit : "하루 입양 후기",
	            reviewTxt : "두번째 글을 쓰네요!! 우리 현 두부 전 해탈이~ 성장!! 벌써 두부가 저희 집에 온지 1달이 훌쩍 넘었어요~아주아주 말썽이지만",
	        },
	        {   
	            reviewThumbnail : "http://daengtopia.com/file_data/daengtopia//2021/03/07/63f965928dfc0e805145b52157264bbd.jpg",
	            reviewTit : "탱고 요이입니다!",
	            reviewTxt : "두번째 글을 쓰네요!! 우리 현 두부 전 해탈이~ 성장!! 벌써 두부가 저희 집에 온지 1달이 훌쩍 넘었어요~아주아주 말썽이지만",
	        },
	     ]
  	  }
    }
});




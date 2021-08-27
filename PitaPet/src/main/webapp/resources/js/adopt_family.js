Vue.component("family-component", {
      template:`
	     <div id="AdoptFamily">
	        <div class="tit-area">
	            <h1 class="main-tit">Adopt animals, Adopt Family</h1>
	            <p class="main-txt">
	                사랑스러운 아이들이 기다리고있어요♥ 가족이 되어주세요
	            </p>
	        </div>
	        <div class="grid-wrap">
	            <family-component-gallery class="grid-left" :family="newAdoptAnimals"></family-component-gallery>
	            <family-component-gallery class="grid-right" :family="adoptAnimals"></family-component-gallery>
	        </div>
	    </div>
      `,
      data(){
    	  return{
    		  newAdoptAnimals:[
                  {
                      adoptThumbnail: "http://daengtopia.com/file_data/daengtopia//2021/04/08/2d79bdb0d182ac12d37439660b49da1e.jpg",
                      location: "강남점",
                      adoptTit: "공주 를 소개합니다",
                      adoptName: "공주",
                      adoptBreed: "프렌치불독",
                      adoptAge: "2개월",
                      adoptGender: "남아",
                      newFamily:true
                  }
              ],
              adoptAnimals:[
                  {
                      adoptThumbnail: "//daengtopia.com/file_data/daengtopia//2021/05/25/65fa30d111115d103384611939325295.jpg",
                      location: "강남점",
                      adoptTit: "공주 를 소개합니다",
                      adoptName: "공주",
                      adoptBreed: "프렌치불독",
                      adoptAge: "2개월",
                      adoptGender: "남아",
                      newFamily:false
                  },
                  {
                      adoptThumbnail: "http://daengtopia.com/file_data/daengtopia//2021/06/28/192b818e2c0db5f1c81112d0500ee0a7.jpg",
                      location: "가산점",
                      adoptTit: "공주 를 소개합니다",
                      adoptName: "공주",
                      adoptBreed: "프렌치불독",
                      adoptAge: "2개월",
                      adoptGender: "남아",
                      newFamily:false
                  },
                  {
                      adoptThumbnail: "http://daengtopia.com/file_data/daengtopia//2021/06/09/66d66d9b3b2bcce91a624444f68523c0.jpg",
                      location: "노량진점",
                      adoptTit: "공주 를 소개합니다",
                      adoptName: "공주",
                      adoptBreed: "프렌치불독",
                      adoptAge: "2개월",
                      adoptGender: "남아",
                      newFamily:false
                  },
                  {
                      adoptThumbnail: "http://daengtopia.com/file_data/daengtopia//2021/06/28/192b818e2c0db5f1c81112d0500ee0a7.jpg",
                      location: "시흥점",
                      adoptTit: "공주 를 소개합니다",
                      adoptName: "공주",
                      adoptBreed: "프렌치불독",
                      adoptAge: "2개월",
                      adoptGender: "남아",
                      newFamily:false
                  },
                  {
                      adoptThumbnail: "http://daengtopia.com/file_data/daengtopia//2021/06/09/66d66d9b3b2bcce91a624444f68523c0.jpg",
                      location: "홍대점",
                      adoptTit: "공주 를 소개합니다",
                      adoptName: "공주",
                      adoptBreed: "프렌치불독",
                      adoptAge: "2개월",
                      adoptGender: "남아",
                      newFamily:false
                  },
                  {
                      adoptThumbnail: "//daengtopia.com/file_data/daengtopia//2021/05/25/65fa30d111115d103384611939325295.jpg",
                      location: "불광점",
                      adoptTit: "공주 를 소개합니다",
                      adoptName: "공주",
                      adoptBreed: "프렌치불독",
                      adoptAge: "2개월",
                      adoptGender: "남아",
                      newFamily:false
                  },
                  {
                      adoptThumbnail: "http://daengtopia.com/file_data/daengtopia//2021/06/28/192b818e2c0db5f1c81112d0500ee0a7.jpg",
                      location: "일산점",
                      adoptTit: "공주 를 소개합니다",
                      adoptName: "공주",
                      adoptBreed: "프렌치불독",
                      adoptAge: "2개월",
                      adoptGender: "남아",
                      newFamily:false
                  },
                  {
                      adoptThumbnail: "//daengtopia.com/file_data/daengtopia//2021/05/25/65fa30d111115d103384611939325295.jpg",
                      location: "안산점",
                      adoptTit: "공주 를 소개합니다",
                      adoptName: "공주",
                      adoptBreed: "프렌치불독",
                      adoptAge: "2개월",
                      adoptGender: "남아",
                      newFamily:false
                  },
                  {
                      adoptThumbnail: "http://daengtopia.com/file_data/daengtopia//2021/06/28/192b818e2c0db5f1c81112d0500ee0a7.jpg",
                      location: "인천논현점",
                      adoptTit: "공주 를 소개합니다",
                      adoptName: "공주",
                      adoptBreed: "프렌치불독",
                      adoptAge: "2개월",
                      adoptGender: "남아",
                      newFamily:false
                  },
                  {
                      adoptThumbnail: "http://daengtopia.com/file_data/daengtopia//2021/06/09/66d66d9b3b2bcce91a624444f68523c0.jpg",
                      location: "부평점",
                      adoptTit: "공주 를 소개합니다",
                      adoptName: "공주",
                      adoptBreed: "프렌치불독",
                      adoptAge: "2개월",
                      adoptGender: "남아",
                      newFamily:false
                  },
                  {
                      adoptThumbnail: "http://daengtopia.com/file_data/daengtopia//2021/06/28/192b818e2c0db5f1c81112d0500ee0a7.jpg",
                      location: "주안점",
                      adoptTit: "공주 를 소개합니다",
                      adoptName: "공주",
                      adoptBreed: "프렌치불독",
                      adoptAge: "2개월",
                      adoptGender: "남아",
                      newFamily:false
                  },
                  {
                      adoptThumbnail: "//daengtopia.com/file_data/daengtopia//2021/05/25/65fa30d111115d103384611939325295.jpg",
                      location: "예술회관점",
                      adoptTit: "공주 를 소개합니다",
                      adoptName: "공주",
                      adoptBreed: "프렌치불독",
                      adoptAge: "2개월",
                      adoptGender: "남아",
                      newFamily:false
                  },
              ]
    	  }
      }
});

Vue.component("family-component-gallery", {
    template:`
	      <ul>
            <li class="gallery-wrap" v-for="(adopt, index) in family" :key="index">
                <div class="gallery-thumb"
                    v-bind:style="{'background-image': 'url(' + adopt.adoptThumbnail + ')'}"></div>
                <div class="txt-wrap">
                    <slot></slot>
                    <p>
                        <span v-if="adopt.newFamily" class="new-stemp">새가족</span>
                        <span class="location-stemp">{{ adopt.location }}</span>
                    </p>
                    <p class="adopt-tit">{{ adopt.adoptTit }}</p>
                    <ul class="adopt-txt">
                        <li>품종 - {{ adopt.adoptBreed }}</li>
                        <li>나이 - {{ adopt.adoptAge }}</li>
                        <li>성별 - {{ adopt.adoptGender }}</li>
                    </ul>
                </div>
            </li> 
        </ul>
    `,
    props:["family"]
});






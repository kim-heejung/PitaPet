Vue.component("page-category", {
    template:`
        <div class="page-category">
           <div class="img-area" :style="{'background-image': 'url(' + cpath + page[index].pageBg + ')'}"></div>
         <div class="txt-area container">
            <h1>{{page[index].pageTit}}</h1>
            <p v-html="page[index].pageTxt"></p>
            <nav aria-label="breadcrumb" style="position:absolute; top:20px; right:0;">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/spring/home.do">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">{{page[index].pageTit}}</li>
              </ol>
            </nav>
         </div>
      </div>
    `,
   props:["cpath", "index"],
   data(){
      return{
         page:[
            {
               pageTit:"입양하기",
               pageTxt:"사랑스러운 아이들의 가족이 되어주세요<br>한 생명의 세상의 달라질 거에요",
               pageBg:"/resources/images/category01.jpg",
            },
            {
               pageTit:"입양후기",
               pageTxt:"보호동물의 가족이 되어준 분들입니다<br>홈페이지 소식은 입양 후 7-10일 정도 소요가 될 수 있습니다",
               pageBg:"/resources/images/category02.jpg",
            },
            {
               pageTit:"핏어팻몰",
               pageTxt:"입양 전 준비부터,<br>입양 후 케어까지 핏어팻 몰과 함께하세요",
               pageBg:"/resources/images/category04.jpg",
            },
            {
               pageTit:"보호소위치",
               pageTxt:"'pit a pet'과 함께하는 보호소입니다<br>방문예약은 전화나 예약게시판을 이용해주세요",
               pageBg:"/resources/images/category05.jpg",
            },
            {
               pageTit:"핏어팻후원",
               pageTxt:"가족들을 기다리는 보호동물들을 위한<br>마음을 전달해보세요",
               pageBg:"/resources/images/category06.jpg",
            },
            {
                pageTit:"상담예약",
                pageTxt:"핏어펫(Pit a Pet) 방문예약은 인터넷으로 가능합니다. 핏어펫(Pit a Pet)은<br>모든 문의사항을 친절하게 상담해 드리고 있습니다.",
                pageBg:"/resources/images/reserve-category.jpg",
             }
         ]
      }
   }
});





Vue.component("header-component", {
      template:`
	      <header id="header">
		        <div class="top">
		            <div class="container" style="display:flex; align-items:center; justify-content:flex-end;">
		            	<div v-if="id == ''" style="display:flex; align-items:center;">
		            		<a :href="cpath + '/users/loginform.do'">로그인</a>
							<a :href="cpath + '/users/signup_form.do'">회원가입</a>
		            	</div>
		            	<div v-else style="display:flex; align-items:center;">
		            		<a :href="cpath + '/users/info.do'">{{ id }}</a> 로그인 중..
							<a :href="cpath + '/users/logout.do'">로그아웃</a>
		            	</div>	
		            </div>
		        </div>
		        <nav class="nav-bar container">
		            <a href="" class="logo">
		                <img :src="cpath + logo">
		                <span>Pit a Pet</span>
		            </a>
		            <ul class="menu-wrap">
		                <li class="menu-list"
		                    v-for="(routes, index) in routes" 
		                    :key="index">
		                    <a v-on:click.prevent="userAccess(index)" href="">
		                        {{ routes.menu }}
		                    </a>
		                </li>
		            </ul>
		        </nav>
		   </header> 
      `,
      props:["cpath", "id"],
      data(){
    	  return{
    		  logo: "/resources/images/logo.png",
              routes:[
                  {
                      menu: "입양절차알아보기",
                      path: "/adopt/procedure.do"
                  },
                  {
                	  menu: "입양하기",
                      path: "/adopt/list.do"
                  },
                  {
                	  menu: "입양후기",
                      path: "/review/list.do"
                  },
                  {
                	  menu: "핏어팻몰",
                	  path: "/shop/list.do"
                  },
                  {
                	  menu: "후원하기",
                      path: "/donation/main.do"
                  }
              ],
    	  }
      },
      methods:{
		userAccess(index){
			if(index == 4 && this.id == ""){
				alert("pit a pet(핏어펫) 회원만 접근할 수 있는 페이지 입니다.");
			}else{
				location.href= this.cpath + this.routes[index].path;
			}
		}
	}
});
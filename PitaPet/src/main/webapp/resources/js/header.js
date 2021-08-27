Vue.component("header-component", {
      template:`
	      <header id="header">
		        <div class="top">
		            <div class="container">
		            	{{login}}
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
		                    <a :href="cpath + routes.path">
		                        {{ routes.menu }}
		                    </a>
		                </li>
		            </ul>
		        </nav>
		   </header> 
      `,
      props:["cpath", "login"],
      data(){
    	  return{
    		  logo: "/resources/images/logo.png",
              routes:[
                  {
                      menu: "입양절차알아보기",
                      path: "/list.html"
                  },
                  {
                	  menu: "입양하기",
                      path: "/list.html"
                  },
                  {
                	  menu: "입양후기",
                      path: "/review/list.do"
                  },
                  {
                	  menu: "후원하기",
                      path: "/list.html"
                  }
              ],
    	  }
      }
});
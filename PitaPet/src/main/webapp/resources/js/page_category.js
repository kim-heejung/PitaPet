Vue.component("page-category", {
    template:`
	     <div class="page-category" style=" border-top:1px solid #ddd; text-align:center;">
			<div class="container" style="padding:6rem 0 4rem; position:relative;">
				<h1 style="font-weight:500; font-size:2.8rem; font-family:'Cormorant Garamond', 'Nanum Myeongjo';">{{name}}</h1>
				<nav aria-label="breadcrumb" style="position:absolute; top:20px; right:0;">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item"><a href="/spring/home.do">Home</a></li>
				    <li class="breadcrumb-item active" aria-current="page">{{name}}</li>
				  </ol>
				</nav>
			</div>
		</div>
    `,
	props:["name"],
});






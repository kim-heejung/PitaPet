Vue.component("page-category", {
    template:`
	     <div class="page-category">
	     	<div class="img-area"></div>
			<div class="txt-area container">
				<h1>{{name}}</h1>
				<p>
					보호동물의 가족이 되어준 분들입니다<br>
					홈페이지 소식은 입양 후 7-10일 정도 소요가 될 수 있습니다
				</p>
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






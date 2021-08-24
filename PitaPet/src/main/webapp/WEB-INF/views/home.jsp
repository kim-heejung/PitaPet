<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>/views/home.jsp</title>
</head>
<body>
<div class="container">
	<section>
		<div id="tabs">
			<button v-for="(tab, index) in tabs"
					v-bind:class="{active: currentTab == index}"
					v-on:click="currentTab = index">{{tab}}</button>
			<div class="tab-content">
				<div v-show="currentTab==0">tab content1</div>
				<div v-show="currentTab==1">tab content2</div>
			</div>
		</div>
		
	</section>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script>
	new Vue({
	    el: '#tabs',
	    data(){
	    	return{
	    		currentTab:0,
	    		tabs:["tab1", "tab2"]
	    	}
	    }
	});
</script>
</body>
</html>

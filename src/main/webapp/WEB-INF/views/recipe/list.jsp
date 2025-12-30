<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3.3.4/dist/vue.global.js"></script>
<script src="https://unpkg.com/vue-demi"></script>
<script src="https://unpkg.com/pinia@2.1.7/dist/pinia.iife.prod.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.container{
	margin-top:50px;
}
.row{
	margin:0px auto;
	width:960px;
}
p {
	overflow:hidden;
	white-space: nowrap;
	text-overflow:ellipsis;

}
.no-link{
	cursor:pointer;
}
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-3" v-for="vo in store.list" :key="vo.no">
			<div class="thumbnail">
		    	<a :href="`/detail?no=`+vo.no">
		        	<img :src="vo.poster" alt="Lights" style="width:230px;height:180px">
		        	<div class="caption">
		          	<p>{{vo.title}}</p>
		          	<p>{{vo.chef}}</p>
		        	</div>
		      	</a>
		    </div>
		</div>
	</div>
	<div class="row text-center" style="margin-top:20px">
		<ul class="pagination text-center" style="margin:0px auto">
			<li v-if="store.startPage!=1"><a class="no-link" @click="store.movePage(1)">&laquo;</a></li>
			<li v-if="store.startPage>1"><a class="no-link" @click="store.movePage(store.startPage-1)">&lt;</a></li>
			<li v-for="i in store.range" :class="i==store.curPage?'active':''"><a class="no-link" @click="store.movePage(i)">{{i}}</a></li>
			<li v-if="store.endPage<store.totalPage"><a class="no-link" @click="store.movePage(store.endPage+1)">&gt;</a></li>
			<li v-if="store.startPage!=store.totalPage"><a class="no-link" @click="store.movePage(store.totalPage)">&raquo;</a></li>
		</ul>
	</div>
</div>
<script src="/js/axios.js"></script>
<script src="/js/recipeStore.js"></script>
<script>
	const {createApp,onMounted} = Vue
	const {createPinia} = Pinia
	const recipeApp = createApp({
		setup(){
			const store = useRecipeStore()
			onMounted(()=>{
				store.recipeListData()
			})
			return{
				store
			}
		}
	
	})
	recipeApp.use(createPinia())
	recipeApp.mount(".container")
</script>
</body>
</html>
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
	<div class="row" id="recipe_detail">
		<table class="table">
			<tbody>
				<tr>
					<td class="text-center" colspan="3" >
						<img :src="store.detail.vo.poster" style="width:600px;height:450px">
					</td>
				</tr>
				<tr>
					<td class="text-center" colspan="3">
						<h3 class="text-center">{{store.detail.vo.title}}</h3>
					</td>
				</tr>
				<tr>
					<td class="text-center" colspan="3">
						{{store.detail.vo.content}}
					</td>
				</tr>
				<tr>
					<td class="text-center"><img src="/images/a1.png"></td>
					<td class="text-center"><img src="/images/a2.png"></td>
					<td class="text-center"><img src="/images/a3.png"></td>
				</tr>
				<tr>
					<td class="text-center">{{store.detail.vo.info1}}</td>
					<td class="text-center">{{store.detail.vo.info2}}</td>
					<td class="text-center">{{store.detail.vo.info3}}</td>
				</tr>
				<tr>
					<td class="text-right" colspan="3">
						<button type="button" class="btn btn-sm btn-danger" onclick="javascript:history.back()">
						목록
						</button>
					</td>
				</tr>
			</tbody>
		</table>
		<table class="table">
			<tbody>
				<tr>
					<td colspan="2" class="text-center"><h3>[조리 순서]</h3></td>
				</tr>
				<tr v-for="(data,index) in store.detail.tList" :key="index">
					<td class="text-left" width=85%>{{data}}</td>
					<td class="text-right" width=15%><img :src="store.detail.iList[index]" style="width:180px;height:120px;"></td>
				</tr>
			</tbody>
		</table>
		<table class="table">
			<tbody>
				<tr>
					<td colspan="2"><h3>[레시피 작성자]</h3></td>
				</tr>
				<tr>
					<td width=20% rowspan="2" class="text-center">
						<img :src="store.detail.vo.chef_poster" style="width:150px;height:150px;" class="img-circle">
					</td>
					<td width=80%>{{store.detail.vo.chef}}</td>
				</tr>
				<tr>
					<td width=80%>{{store.detail.vo.chef_profile}}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row" style="margin-top:20px" id="recipe_reply">
		
	</div>
</div>
<script src="/js/axios.js"></script>
<script src="/js/recipeStore.js"></script>
<script>
	const {createApp,onMounted} = Vue
	const {createPinia} = Pinia
	const detailApp = createApp({
		setup(){
			const store=useRecipeStore()
			const params = new URLSearchParams(location.search)
			const no = params.get('no')
			onMounted(()=>{
				store.recipeDetailData(no)
			})
			
			return {
				store
			}
		}
	})
	detailApp.use(createPinia())
	detailApp.mount('#recipe_detail')
</script>
</body>
</html>
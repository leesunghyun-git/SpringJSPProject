const {defineStore} = Pinia
const useRecipeStore = defineStore('recipe',{
	// state : 공통 사용 변수 , props
	state:()=>({
		list:[],
		curPage:1,
		totalPage:0,
		startPage:0,
		endPage:0,
		detail:{
			vo:{},
			tList:[],
			iList:[]
		}
	}),
	getters:{
		range:(state)=>{
			const arr =[]
			for(let i=state.startPage;i<=state.endPage;i++)
			{
				arr.push(i)
			}
			return arr
		}
	},
	actions:{
		// default 매개변수 => recipeListData() recipeListData(2)
		async recipeListData(){
			const res = await api.get('/recipe/list_vue/',{
				params:{
					page:this.curPage
				}
			})
			this.setPageData(res.data)
		},
		setPageData(data){
			this.curPage=data.curPage
			this.list=data.list
			this.startPage=data.startPage
			this.endPage=data.endPage
			this.totalPage=data.totalPage
		},
		movePage(page){
			this.curPage=page
			this.recipeListData()
		},
		async recipeDetailData(no){
			const res = await api.get(`/recipe/detail_vue/?no=${no}`)
			this.detail=res.data
		}
		
	}
})

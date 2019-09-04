

// Vue.component(
//     "item-list",
//     {
//     props:["content"],
//     template:"<li>{{content}}</li>>"
//     }
// )
var todoItem = {
    props:["content","index"],
    template:"<li @click='deleteItem'>{{content}}</li>",
    methods:{
        deleteItem:function () {
            this.$emit("delete-item",this.index)
        }
    }
}

// var home = {template:'<p>首页 {{$route.params.index}}</p>'}
// var list = {template:'<p>列表</p>'}

var user = {template:'<div><p>user {{$route.params.id}}</p><router-view></router-view></div>'}
var detail = {template:'<p>详情</p>'}
var productList = {template:'<p>列表</p>'}

var routes = [
    // {path:"/home/:index",component:home},
    // {path:"/list",component:list},
    {path:'/user/:id',component:user,
     children:[
         {
             path:'detail',component:detail
         },
         {
             path:'plist',component:productList
         }
     ]

    }
]

var router = new VueRouter({
    routes
})

var vm = new Vue({
    el:"#app",
    data:{
        userInfo:{
            username:"zhangsan",
            password:"123456"
        },
        content:"<span>这是span</span>",
        pid:"21",
        message:false,
        firstname:"",
        lastname:"",
        count:0,
        product:[1,2,3,4,5,6],
        data:"",
        list:[],
        productList:[]
    },
    router,
    components:{
      "todo-item":todoItem
    },
    methods:{
        div1:function(){
          console.log("div1")
        },
        div2:function(){
          console.log("div2")
        },
        div3:function(){
          console.log("div3")
        },
        let_stop:function(event){
          event.preventDefault();
        },
        handleDelete:function(index){
          this.list.splice(index,1)
        },
        getList:function(){
          this.list.push(this.data);
          this.data = "";
        },
        showAndHidden:function(){
          this.message = !this.message;
        },
        clickme:function () {
            console.log("========click=========")
        },
        getProducts:function () {
            var _vm = this
            axios.get('http://localhost:8080/user/product/search.do?productName=电脑')
                .then(function (response) {
                    console.log(response)
                    console.log(response.status)
                    console.log(response.data.data)
                    console.log(response.data.data.list)
                    _vm.productList = response.data.data.list;
                })
                .catch(function () {
                    vm.answer = 'can not reach api'
                })
        }
    },
    computed:{
      fullname:function () {
          return this.firstname+this.lastname;
      }
    },
    watch:{
      firstname:function () {
          this.count++;
      }
    },
    beforeCreate:function () {
        console.log("==========beforeCreate===========")
        console.log("==========beforeCreate===========vm "+this)
        console.log("==========beforeCreate===========data "+this.userInfo)
        console.log("==========beforeCreate===========el "+this.$el)
    },
    created:function () {
        console.log("==========created===========")
        console.log("==========created===========vm "+this)
        console.log("==========created===========data "+this.userInfo)
        console.log("==========created===========el "+this.$el)
    },
    beforeMount:function () {
        console.log("==========beforeMount===========")
        console.log("==========beforeMount===========vm "+this)
        console.log("==========beforeMount===========data "+this.userInfo)
        console.log("==========beforeMount===========el "+this.$el)
    },
    mounted:function () {
        console.log("==========mount===========")
        console.log("==========mount===========vm "+this)
        console.log("==========mount===========data "+this.userInfo)
        console.log("==========mount===========el "+this.$el)
    }


})
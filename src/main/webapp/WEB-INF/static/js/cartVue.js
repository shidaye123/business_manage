



var vm = new Vue({
    el:"#myVue",
    data:{
        cart_list:[]
    },
    methods:{
        getCartList:function () {
            var _vm = this
            axios.get('http://localhost:8080/cart/list.do')
                .then(function (response) {
                    console.log(response)
                })
                .catch(function (reason) {
                    vm.answer = 'can not reach api'
                })
        }
    },
    mounted:function () {
        this.getCartList()
    }
})
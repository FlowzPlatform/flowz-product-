<template>
	<div>
	<div class="subscriptionList">
		<div class="container">
      <div class="row">
          <div class="col-md-12">
              <div class="page-header">
              </div>
          </div>
      </div>
      <div class="row">
          <div class="col-md-4" v-for="(item, index) in mainData" >
              <div class="panel panel-info">
                  <div class="panel-heading">
                      <h3 class="text-center">{{item.name.toUpperCase()}}</h3></div>
                  <div class="panel-body text-center" style="min-height: 200px;max-height:200px;">
                    <p class="lead" style="font-size:40px"><strong>${{item.price}} / {{item.validity}} {{item.time_unit}}</strong></p>
                    <ul class="list-group list-group-flush text-center">
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> {{item.description}} </li>
                    <!-- <li class="list-group-item"><i class="icon-ok text-danger"></i> Personal use</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> Unlimited projects</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> 27/7 support</li> -->
                    </ul>
                  </div>
                  <div class="panel-footer">
                      <a class="btn btn-lg btn-block btn-danger" @click="checkoutFunction(item.id)">SUBSCRIBE !</a>
                  </div>
              </div>
          </div>
      </div>
    </div>
	</div>
</div>
</template>
<script>
// import defaultSubscription from '@/api/default-subscription'
// import axios from 'axios'
import subscriptionPlans from '@/api/subscription-plans'

  export default {
    name: 'subscriptionList',
    data () {
      return {
        mainData: []
      }
    },
    methods: {
      init () {
        let self = this
        subscriptionPlans.get().then(res => {
            self.mainData = res.data.data
        }).catch(err => {
            self.$Notice.error({
                duration: 5,
                title: 'Fetching subscription plans',
                desc: err
            });
        })
        // axios({ method:'get',
        //     url:"http://localhost:3030/subscription-plans"
        // }).then(response => {
        //     console.log("response.....",response)
        //     for(let i=0;i<response.data.data.length;i++){
        //         this.mainData.push(response.data.data[i])
        //     }
        // })
        // .catch(function (error) {
        //     console.log("**********",error)
        //     self.$Notice.error({
        //         duration: 5,
        //         title: 'Please check...some error'
        //     });
        // });
      },
      checkoutFunction (sub_id) {
        this.$router.push('/checkout/' + sub_id)
      }
    },
    mounted () {
      this.init()
    }
  }
</script>
<style scoped>

</style>
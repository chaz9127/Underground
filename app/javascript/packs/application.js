/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import Vue from 'vue/dist/vue.esm'
import VueRouter from 'vue-router/dist/vue-router.esm'
import HomePage from '../components/home-page.vue'
import NewOrReturning from '../components/new-or-returning.vue'
import PurchaseTicket from '../components/purchase-ticket.vue'
import Event from '../components/event.vue'

document.addEventListener('DOMContentLoaded', () => {
  Vue.use(VueRouter)
  const routes = [
    { name: 'home', path: '/', component: HomePage },
    { name: 'new-or-returning', path: '/new-or-returning', component: NewOrReturning },
    { name: 'purchase-ticket', path: '/purchase-ticket/:context', component: PurchaseTicket },
    { name: 'events', path: '/events', component: Event }
  ]

  const router = new VueRouter({
    mode: 'history',
    routes // short for `routes: routes`
  })

  const app = new Vue({
    router,
    el: '#geektionary',
    components: { HomePage }
  })
  
})

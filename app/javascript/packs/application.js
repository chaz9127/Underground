/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

var store = {
  debug: true,
  state: {
    message: 'Hello!'
  },
  setMessageAction (newValue) {
    if (this.debug) console.log('setMessageAction triggered with', newValue)
    this.state.message = newValue
  },
  clearMessageAction () {
    if (this.debug) console.log('clearMessageAction triggered')
    this.state.message = ''
  }
}

import Vue from 'vue/dist/vue.esm'
import VueRouter from 'vue-router/dist/vue-router.esm'
import VueResource from 'vue-resource/dist/vue-resource.esm'
import HomePage from '../components/home-page.vue'
import NewOrReturning from '../components/new-or-returning.vue'
import PurchaseTicket from '../components/purchase-ticket.vue'
import Event from '../components/event.vue'
import CreateEvent from '../components/create-event.vue'
import Datetime from 'vue-datetime'
// You need a specific loader for CSS files
import 'vue-datetime/dist/vue-datetime.css'

document.addEventListener('DOMContentLoaded', () => {

  Vue.use(VueResource);
  Vue.use(VueRouter);
  Vue.use(Datetime);

  Vue.http.options.root = 'http://localhost:3000/';
  
  const routes = [
    { name: 'home', path: '/', component: HomePage },
    { name: 'new-or-returning', path: '/new-or-returning', component: NewOrReturning },
    { name: 'purchase-ticket', path: '/purchase-ticket/:context', component: PurchaseTicket },
    { name: 'events', path: '/events', component: Event },
    { name: 'create-event', path: '/events/new', component: CreateEvent }
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

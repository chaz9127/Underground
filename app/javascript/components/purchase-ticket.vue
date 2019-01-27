<template>
  <div>
    <h2 class="text-center">{{welcomeMessage()}} {{EventStore.customerType}}</h2>
    <form class="needs-validation big-form">
      <div class="form-row margin-top">
        <div class="col-4 offset-4">
          <label class="big-form-label" for="email">E-Mail</label>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text big-form-prepend" id="inputGroupPrepend"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
            </div>
            <input type="email" class="form-control" id="email" placeholder="E-mail" aria-describedby="inputGroupPrepend">
          </div>
        </div>
      </div>
      <div class="form-row margin-top">
        <div class="col-4 offset-4">
          <label class="big-form-label" for="first-name">First Name</label>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text big-form-prepend" id="inputGroupPrepend"><i class="fa fa-user" aria-hidden="true"></i></span>
            </div>
            <input type="text" class="form-control" id="first-name" placeholder="First Name" aria-describedby="inputGroupPrepend">
          </div>
        </div>
      </div>
      <div class="form-row margin-top">
        <div class="col-4 offset-4">
          <label class="big-form-label" for="email">Last Name</label>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text big-form-prepend" id="inputGroupPrepend"><i class="fa fa-user" aria-hidden="true"></i></span>
            </div>
            <input type="text" class="form-control" id="last-name" placeholder="Last Name" aria-describedby="inputGroupPrepend">
          </div>
        </div>
      </div>
      <div class="form-row margin-top">
        <div class="col-4 offset-4">
          <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#confirmModal">Purchase</button>
        </div>
      </div>
    </form>

    <!-- Modal -->
    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="confirmModalLabel">You're All Set!</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            Please give the device back and enjoy your time!
          </div>
          <div class="modal-footer">
            <button v-on:click="goTo('/')" data-dismiss="modal"  type="button" class="btn btn-primary">Done</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import EventStore from '../stores/event-store.js';

  export default {
    data: function () {
      return {
        EventStore: EventStore.data
      }
    },
    methods: {
      welcomeMessage: function() {
        if (this.$route.params.context === 'new') {
          return 'Welcome to Underground!';
        } else {
          return 'Welcome Back to Underground!';
        }
      },
      goTo: function(name) {
        this.$router.push(name)
      }
    }
  }
</script>

<style scoped>

</style>
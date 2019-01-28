<template>
  <div>
    <h2 class="text-center">Welcome to Underground!</h2>
    <form class="needs-validation big-form">
      <div class="form-row margin-top">
        <div class="col-4 offset-4">
          <label class="big-form-label" for="email">E-Mail (optional)</label>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text big-form-prepend" id="inputGroupPrepend"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
            </div>
            <input v-model="EventStore.customer.firstEmail" type="email" class="form-control" id="email" placeholder="E-mail" aria-describedby="inputGroupPrepend">
          </div>
        </div>
      </div>
      <div class="form-row margin-top">
        <div class="col-4 offset-4">
          <label class="big-form-label" for="first-name">First Name (optional)</label>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text big-form-prepend" id="inputGroupPrepend"><i class="fa fa-user" aria-hidden="true"></i></span>
            </div>
            <input v-model="EventStore.customer.firstName" type="text" class="form-control" id="first-name" placeholder="First Name" aria-describedby="inputGroupPrepend">
          </div>
        </div>
      </div>
      <div class="form-row margin-top">
        <div class="col-4 offset-4">
          <label class="big-form-label" for="email">Last Name (optional)</label>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text big-form-prepend" id="inputGroupPrepend"><i class="fa fa-user" aria-hidden="true"></i></span>
            </div>
            <input v-model="EventStore.customer.lastName" type="text" class="form-control" id="last-name" placeholder="Last Name" aria-describedby="inputGroupPrepend">
          </div>
        </div>
      </div>
      <div class="form-row margin-top">
        <div class="col-4 offset-4">
          <button class="btn btn-primary" type="button" v-on:click="purchaseTicket()">Purchase</button>
        </div>
      </div>
    </form>

    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="confirmModalLabel">{{modalHeader}}</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            {{modalBody1}}
            <br>
            {{modalBody2}}
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
        EventStore: EventStore.data,
        modalHeader: '',
        modalBody1: '',
        modalBody2: ''
      }
    },
    methods: {
      goTo: function(name) {
        this.$router.push(name)
      },
      purchaseTicket: function() {
        EventStore.methods.setCustomer({
          type: 'new',
          firstName: EventStore.data.customer.firstName,
          lastName: EventStore.data.customer.lastName,
          email:  EventStore.data.customer.email
        });

        var params = EventStore.methods.purchaseTicketParams();
        this.$http.post('/api/customer_purchases', params).then(response => {
          var ticketDisplay = response.data.customer_purchase.ticket.display
          this.modalHeader = "You're All Set!";
          this.modalBody1 = "Thank you for purchasing " + ticketDisplay + "!";
          this.modalBody2 = "Please give the machine back and enjoy your time!";
          $('#confirmModal').modal('show');
        }, response => {
          console.log('fail');
        });
      }
    }
  }
</script>

<style scoped>

</style>
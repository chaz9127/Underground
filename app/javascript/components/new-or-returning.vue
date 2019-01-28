<template>
  <div>
    <div class="row">
      <h2 class="mx-auto mb-4 center-text">Is the customer New or Returning?</h2>
    </div>
    <div class="row justify-content-around">
      <div class="col-6">
        <div class="inline-error" v-if="!EventStore.valid && !EventStore.selectedTicket">
          * Please select a ticket *
        </div>
        <div class="input-group">
          <select v-model="EventStore.selectedTicket" id="tickets" class="big-form-element custom-select tickets" required>
            <option value="0">Select a Ticket</option>
            <option v-for="ticket in EventStore.event.tickets" v-bind:value="ticket.id">{{ticket.display}}</option>
          </select>
        </div>
      </div>
    </div>
    <div class="row justify-content-around mt-3">
      <div class="col-6">
        <nav-button
          :when-clicked="setNewCustomerType"
          route-name="purchase-ticket"
          route-context="new"
          button-text="New Customer">
        </nav-button>
      </div>
    </div>
    <div class="row justify-content-around margin-top">
      <div class="col-6">
        <nav-button
          :when-clicked="purchaseTicketForReturningUser"
          button-text="Returning Customer">
        </nav-button>
      </div>
    </div> 
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
  import NavButton from '../components/nav-button.vue';
  import EventStore from '../stores/event-store.js';

  export default {
    beforeDestroy (to, from, next) {
      if (this.$route.name === 'home' ) {
        window.location = '/';
      }
    },
    data: function () {
      return {
        EventStore: EventStore.data,
        invalid: false,
        modalBody1: '',
        modalBody2: '',
        modalHeader: ''
      }
    },
    methods: {
      purchaseTicketForReturningUser: function() {
        if (!this.isValid()) {
          return false
        }

        EventStore.methods.setCustomer({
          type: 'returning',
          firstName: '',
          lastName: '',
          email: ''
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
        return true;
      },
      setNewCustomerType: function() {
        if (this.isValid()) {
          EventStore.methods.setCustomer('new');
          return true;
        } else {
          return false;
        }
      },
      isValid: function() {
        EventStore.data.valid = !!EventStore.data.selectedTicket;
        return EventStore.data.valid;
      },
      goTo: function(name) {
        $('#confirmModal').modal('hide')
        this.$router.push(name)
      }
    },
    components: { NavButton }
  }
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>
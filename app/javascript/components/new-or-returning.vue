<template>
  <div>
    <div class="row">
      <h2 class="mx-auto mb-4 center-text">Is the customer New or Returning?</h2>
    </div>
    <div class="row justify-content-around">
      <div class="col-6">
        <div class="input-group">
          <select v-model="EventStore.selectedTicket" id="tickets" class="big-form-element custom-select tickets" required>
            <option value="0">Select a Ticket</option>
            <option v-for="ticket in EventStore.event.tickets" v-bind:value="ticket.id">{{ticket.display}}</option>
          </select>
          <div v-if="invalid" class="invalid-feedback">Please select a ticket to purchase!</div>
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
          :when-clicked="openModal"
          button-text="Returning Customer">
        </nav-button>
      </div>
    </div> 
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
        invalid: false
      }
    },
    methods: {
      openModal: function() {
        $('#confirmModal').modal('show');
        return true;
      },
      setNewCustomerType: function() {
        if (this.isValid()) {
          EventStore.methods.setCustomerType('new');
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
<template>
  <div>
    <div class="row">
      <h2 class="mx-auto mb-4">Is the customer New or Returning?</h2>
    </div>
    <div class="row justify-content-around">
      <div class="col-4">
        <div class="input-group">
          <select v-model="EventStore.selectedTicket" id="tickets" class="big-form-element custom-select tickets" required>
            <option value="0">Select a Ticket</option>
            <option v-for="ticket in EventStore.event.tickets" v-bind:value="ticket.id">{{ticket.display}}</option>
          </select>
          <div v-if="invalid" class="invalid-feedback">Please select a ticket to purchase!</div>
        </div>
      </div>
    </div>
    <div class="row justify-content-around margin-top">
      <nav-button
        @callthis="setNewCustomerType()"
        route-name="purchase-ticket"
        route-context="new"
        button-text="New Customer">
      </nav-button>
    </div>
    <div class="row justify-content-around margin-top">
      <nav-button
        @callthis="setReturningCustomerType()"
        route-name="purchase-ticket"
        route-context="returning"
        button-text="Returning Customer">
      </nav-button>
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
      console.log('destroyed');
    },
    data: function () {
      return {
        EventStore: EventStore.data,
        invalid: false
      }
    },
    methods: {
      setNewCustomerType: function() {
        if (this.valid()) {
          EventStore.methods.setCustomerType('new');
        } else {
          this.invalid = true;
        }

        return 'anything else';
      },
      setReturningCustomerType: function() {
        if (this.valid()) {
          EventStore.methods.setCustomerType('returning');
        } else {
          this.invalid = true;
        }

        return !this.invalid;
      },
      valid: function() {
        console.log(EventStore.data.selectedTicket);
        return !!EventStore.data.selectedTicket;
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
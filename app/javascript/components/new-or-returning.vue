<template>
  <div>
    <div class="row">
      <h2 class="mx-auto mb-4">Is the customer New or Returning?</h2>
    </div>
    <div class="row justify-content-around">
      <div class="col-4">
        <label class="big-form-label" for="tickets">Ticket</label>
        <div class="input-group">
          <select id="tickets" class="big-form-element custom-select tickets" required>
            <option value="">Select a Ticket</option>
            <option value="1">Ticket Name ($9.16)</option>
            <option value="2">Ticket Name ($17.38)</option>
            <option value="2">Ticket Name ($17.38)</option>
          </select>
          <div class="invalid-feedback">Please select a ticket to purchase!</div>
        </div>
      </div>
    </div>
    <div class="row justify-content-around margin-top">
      <nav-button
        route-name="purchase-ticket"
        route-context="new"
        button-text="New Customer">
      </nav-button>
    </div>
    <div class="row justify-content-around margin-top">
      <nav-button
        route-name="purchase-ticket"
        route-context="returning"
        button-text="Returning Customer">
      </nav-button>
    </div>
  </div>
</template>

<script>
  import NavButton from '../components/nav-button.vue';

  export default {
    data: function () {
      return {}
    },
    methods: {},
    components: { NavButton }
  }
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>
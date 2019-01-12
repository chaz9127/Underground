<template>
  <div>
    <div class="row justify-content-around">
      <nav-button
        route-name="new-or-returning"
        button-text="Purchase New Ticket!"
        icon="fa fa-ticket">
      </nav-button>
      <nav-button
        route-name="dashboard"
        button-text="View Analyitics"
        icon="fa fa-bar-chart">
      </nav-button>
    </div>
    <div class="row justify-content-around margin-top">
      <nav-button
        route-name="events"
        button-text="Create/Edit Events"
        icon="fa fa-calendar-o">
      </nav-button>
      <nav-button
        route-name="dashboard"
        button-text="Add Admin User"
        icon="fa fa-user">
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
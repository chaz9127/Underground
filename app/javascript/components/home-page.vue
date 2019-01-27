<template>
  <div>
    <div class="row justify-content-around margin-top">
      <nav-button
        route-name="new-or-returning"
        route-context="new-or-returning"
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
  import EventStore from '../stores/event-store.js';

  export default {
    data: function () {
      return {
        EventStore: EventStore.data
      }
    },
    methods: {},
    components: { NavButton },
    beforeMount: function() {
      var params = {
        params: {
          latest: true
        }
      };
      
      this.$http.get('/api/events', params).then(response => {
        EventStore.methods.addEvent(response.body.events[0]);
      }, response => {
        console.log('error', response)
      });
    }
  }
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>
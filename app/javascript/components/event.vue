<template>
  <div>
    <div class="margin-top">
      <button class="btn btn-primary" v-on:click="goTo('create-event')">Create New Event</button>
    </div>
    <table class="table margin-top">
      <thead>
        <tr>
          <th></th>
          <th scope="col">Date</th>
          <th scope="col">Name</th>
          <th scope="col">Type</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="event in events">
          <td></td>
          <td>{{properDate(event.start_date)}}</td>
          <td>{{event.event_name}}</td>
          <td v-bind:class="{'special': event.event_type == 'special'}" class="capitalize">{{event.event_type}}</td>
          <td><button class="btn btn-success margin-right-x-small">Duplicate</button><button class="btn btn-warning">Edit</button></td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
  export default {
    beforeDestroy () {
      if (this.$route.name === 'home' ) {
        window.location = '/';
      }
    },
    beforeCreate() {
      this.$http.get('/api/events').then(response => {
        this.events = response.data.events;
      }, response => {
        
      });
    },
    data: function () {
      return {
        events: []
      }
    },
    methods: {
      goTo: function(name) {
        this.$router.push({name: name})
      },
      properDate: function(date) {
        var date = moment(date).format('MMMM Do YYYY');
        return date;
      }
    },
    components: {}
  }
</script>

<style scoped>
  .special {
    color: green;
  }
</style>
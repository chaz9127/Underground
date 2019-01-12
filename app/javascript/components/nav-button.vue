<template>
  <div class="col-4">
    <div v-on:click="goTo(routeName, routeContext)" class="card clickable text-center">
      <div class="card-body">
        <span class="stats-small__label">{{buttonText}}</span>
        <br>
        <i v-bind:class="icon" class="card-icon margin-top" aria-hidden="true"></i>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: ['routeName', 'routeContext', 'buttonText', 'icon'],
    data: function () {
      return {}
    },
    methods: {
      goTo: function(name, context) {
        console.log(name, context)
        this.$router.push({name: name, params: { context: context }});
      }
    }
  }
</script>

<style scoped>

</style>
<template>
  <div class="col-4">
    <div v-on:click="goTo(routeName, routeContext);" class="card clickable text-center">
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
    props: {
      routeName: { type: String },
      routeContext: { type: String },
      buttonText: { type: String },
      icon: { type: String },
      callthis: { type: Function, default: function() { return 'unset' } }
    },
    data: function () {
      return {
        
      }
    },
    methods: {
      goTo: function(name, context) {
        this.$router.push({ name }, { context });
      }
    },
    beforeMount() {
      console.log('new+26');
    }
  }
</script>

<style scoped>

</style>
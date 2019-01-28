<template>
  <div v-on:click="goTo(routeName, routeContext);" class="card clickable text-center">
    <div class="card-body">
      <span>{{buttonText}}</span>
      <br>
      <i v-bind:class="icon" class="card-icon mt-4" aria-hidden="true"></i>
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
      whenClicked: { type: Function, default: function() { return true } }
    },
    data: function () {
      return {
        
      }
    },
    methods: {
      goTo: function(name, context) {
        if (this.whenClicked()) {
          if (name) {
            this.$router.push({ name, params: { context }});
          }
        } else {
          console.log('not valid homie')
        }
      }
    }
  }
</script>

<style scoped>

</style>
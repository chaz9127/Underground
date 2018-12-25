window.onload = function() {
  new Vue({
    el: '#nav-cards',
    methods: {
      goTo: function (path) {
        window.location = path;
      }
    }
  })
}
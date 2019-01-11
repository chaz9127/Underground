window.onload = function() {
  new Vue({
    el: '#nav-cards',
    methods: {
      goTo: function (path) {
        window.location = path;
      }
    }
  })



  var ctx = document.getElementById("myChart");

  var myPieChart = new Chart(ctx,{
    type: 'pie',
    data: {
      datasets: [{
        data: [10, 20, 30],
        backgroundColor: [
          '#FF0000',
          '#00FF00',
          '#0000FF'
        ]
      }],
      labels: [
        'Red',
        'Green',
        'Blue'
      ]
    },
    options: {}
  });
}
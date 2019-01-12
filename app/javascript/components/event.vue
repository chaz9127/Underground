<template>
  <div>
    <div class="margin-top">
      <button class="btn btn-primary">Create New Event</button>
    </div>
    <table class="table margin-top">
      <thead>
        <tr>
          <th scope="col">Date</th>
          <th scope="col">Name</th>
          <th scope="col">Type</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>01/05/2019</td>
          <td>CC Bachata</td>
          <td class="special">Special</td>
          <td><button class="btn btn-success margin-right">Duplicate</button><button class="btn btn-warning">Edit</button></td>
          <td></td>
        </tr>
        <tr>
          <td>12/01/2018</td>
          <td>CC Bachata</td>
          <td class="special">Special</td>
          <td><button class="btn btn-success margin-right">Duplicate</button><button class="btn btn-warning">Edit</button></td>
          <td></td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
  export default {
    data: function () {
      return {}
    },
    methods: {},
    components: {}
  }
</script>

<style scoped>
  .special {
    color: green;
  }
</style>
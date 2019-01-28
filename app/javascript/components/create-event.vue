<template>
  <div>
    <h2 class="mt-4 offset-md-2">Create New Event</h2>
    <form class="needs-validation big-form">
      <div class="form-row mt-4">
        <div class="col-12 col-md-8 offset-md-2">
          <label class="big-form-label" for="name">Name</label>
          <div class="input-group">
            <input type="text" class="form-control event-param" id="name" placeholder="Event Name" aria-describedby="inputGroupPrepend" v-model="name" required>
          </div>
        </div>
      </div>
      <div class="form-row mt-4">
        <div class="col-12 col-md-8 offset-md-2">
          <label class="big-form-label" for="description">Description</label>
          <div class="input-group">
            <textarea type="text" class="form-control event-param" id="description" placeholder="Event Description" aria-describedby="inputGroupPrepend" v-model="description">
            </textarea>
          </div>
        </div>
      </div>
      <div class="form-row mt-4">
        <div class="col-12 col-md-8 offset-md-2">
          <label class="big-form-label" for="regularType">Type</label>
          <div class="input-group">
            <select v-model="type" id="regularType" class="custom-select event-param" required>
              <option value="regular">Regular</option>
              <option value="special">Special</option>
            </select>
            <div class="invalid-feedback">Please select a ticket to purchase!</div>
          </div>
        </div>
      </div>
      <div class="form-row mt-4">
        <div class="col-12 col-md-8 offset-md-2">
          <label class="big-form-label" for="regularType">Date</label>
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text" id="inputGroupPrepend"><i class="fa fa-calendar-o" aria-hidden="true"></i></span>
            </div>
            <datetime input-class="form-control" v-bind:use12-hour="true" v-bind:minute-step="15" v-bind:type="'datetime'" v-model="date"></datetime>
          </div>
        </div>
      </div>
      <h2 class="mt-4 offset-md-2">Add Tickets <button class="btn btn-success" type="button" v-on:click="addTicket()"><i class="fa fa-plus" aria-hidden="true"></i></button></h2>
      <!-- <button class="btn btn-success" type="button" v-on:click="addTicket()">Add ticket</button> -->
      <div class="form-row mt-4" v-for="(ticket, idx) in tickets">
        <div class="col-6 col-md-4 offset-md-2">
          <div class="input-group">
            <input type="text" class="form-control ticket-param" v-bind:id="'ticketName-' + idx" placeholder="Ticket Name" aria-describedby="inputGroupPrepend" v-model="ticket.name" required>
          </div>
        </div>
        <div class="col-4 col-md-3">
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text big-form-prepend" id="inputGroupPrepend"><i class="fa fa-usd" aria-hidden="true"></i></span>
            </div>
            <input type="number" class="form-control ticket-param" v-bind:id="'ticketPrice-' + idx" placeholder="Price" aria-describedby="inputGroupPrepend" v-model="ticket.price">
          </div>
        </div>
        <div class="col-2 col-md-1">
          <button class="btn btn-danger w-100" type="button" v-on:click="removeTicket(idx)"><i class="fa fa-minus" aria-hidden="true"></i></button>
        </div>
      </div>
      <div class="form-row mt-4">
        <div class="col-12 col-md-8 offset-md-2">
          <button class="btn btn-primary w-100" type="button" v-on:click="createEvent()"data-toggle="modal" data-target="#confirmModal">Create Event</button>
        </div>
      </div>
    </form>

    <!-- Modal -->
    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header text-white" v-bind:class="{'bg-success': success == true, 'bg-danger': success == false }">
            <h5 class="modal-title" id="confirmModalLabel">{{modalHeader}}</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <span v-for="message in modalBody">
              {{message}}
              <br>
            </span>
            
          </div>
          <div class="modal-footer">
            <button v-on:click="goToEvent('events')" data-dismiss="modal"  type="button" class="btn btn-primary">Done</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    data: function () {
      return {
        success: true,
        modalHeader: '',
        modalBody: [],
        name: null,
        description: null,
        type: 'regular',
        date: null,
        tickets: [{name: '', price: null}]
      }
    },
    methods: {
      goToEvent: function(name) {
        if (this.success) {
          this.goTo(name);
        }
      },
      goTo: function(name) {
        this.$router.push({name: name})
      },
      addTicket: function() {
        this.tickets.push({name: '', price: 0})
      },
      removeTicket: function(idx) {
        this.tickets.splice(idx, 1);
      },
      validate: function() {
        var requiredElements = document.querySelectorAll('.event-param[required]');
        var returnMap = {
          message: [],
          valid: true
        }

        for (var x = 0; x < requiredElements.length; x++) {
          var el = requiredElements[x];
          if (!el.value) {
            returnMap.message.push("- " + el.placeholder + " seems to be invalid please check and try again!")
            returnMap.valid = false;
          }
        }

        if (!this.date) {
          returnMap.message.push("- Please Enter a date!");
          returnMap.valid = false;
        }

        return returnMap;
      },
      createEvent: function() {
        this.success = null;
        var validation = this.validate();
        if (!validation.valid) {
          this.modalHeader = "Error!"
          this.modalBody = validation.message;
          this.success = false;
          return;
        }

        var params = {
          event: {
            event_type: this.type,
            description: this.description,
            name: this.name,
            tickets: this.tickets,
            start_date: this.date
          }
        }
        this.$http.post('/api/events', params).then(response => {
          this.success = true;
          this.modalHeader = "Event Created!"
          this.modalBody = ['You should be all set, click the link below to view your event.'];
        }, response => {
          this.success = false;
          this.modalHeader = "Error!"
          this.modalBody = ['There was an error, please double check the fields and try again! Or just call CJ'];
        });
      }
    }
  }
</script>

<style scoped>
  .vdatetime {
    width: calc( 100% - 42px );
  }
</style>
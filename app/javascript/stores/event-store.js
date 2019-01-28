const EventStore = {
  data: {
    event: {},
    customer: {
      type: '',
      firstName: '',
      lastName: '',
      email: ''
    },
    selectedTicket: 0,
    valid: true
  },
  methods: {
    addEvent: function(event) {
      EventStore.data.event = event;
    },
    selectTicket: function(ticketId) {
      EventStore.data.selectedTicket = ticketId;
    },
    setCustomer: function(customerParams) {
      EventStore.data.customer = {
        type: customerParams.type,
        firstName: customerParams.firstName,
        lastName: customerParams.lastName,
        email: customerParams.email
      }
    },
    purchaseTicketParams: function() {
      return {
        customer_purchase: {
          ticket_id: EventStore.data.selectedTicket,
          customer_type: EventStore.data.customer.type,
          first_name: EventStore.data.customer.firstName,
          last_name: EventStore.data.customer.lastName,
          email: EventStore.data.customer.email,
          event_id: EventStore.data.event.id
        }
      }
    }
  }
};

export default EventStore;
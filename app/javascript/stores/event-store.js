const EventStore = {
  data: {
    event: {},
    selectedTicket: 0,
    customerType: ''
  },
  methods: {
    addEvent: function(event) {
      EventStore.data.event = event;
    },
    selectTicket: function(ticketId) {
      EventStore.data.selectedTicket = ticketId;
    },
    setCustomerType: function(customerType) {
      EventStore.data.customerType = customerType;
    }
  }
};

export default EventStore;
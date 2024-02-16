import consumer from "channels/consumer"

consumer.subscriptions.create({ channel: "ChatChannel", room_id: roomId }, {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('Connected to chat channel');
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('Disconnected from chat channel');
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log('Received message:', data);
    // Handle incoming message
  }
});

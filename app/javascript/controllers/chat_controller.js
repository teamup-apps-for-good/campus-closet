import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chat"
export default class extends Controller {
  static values = { currentUserId: String }; // MAY HAVE TO EDIT FOR PROPER USER ID PARAMS
  
  // set up observers when the controller connects
  connect() {
    console.log("connecting...");
    this.setupScrollListener();
    this.setupMessageListener();
    console.log("connected");
  }

  // disconnect observers when the controller disconnects
  disconnect() {
    this.scrollObserver.disconnect();
    this.messageObserver.disconnect();
    console.log("disconnecting");
  }

  // set up an observer to scroll the chatbox to the bottom
  setupScrollListener() {
    this.scrollToBottom();

    this.scrollObserver = new MutationObserver(() => {
      this.scrollToBottom();
    });

    this.scrollObserver.observe(this.element, {
      childList: true,
      subtree: true,
    });
  }

  // set up an observer to style messages
  setupMessageListener() {
    console.log("message listener");
    this.styleExistingMessages();

    this.messageObserver = new MutationObserver((mutations) => {
      this.styleAddedNodes(mutations);
    });

    this.messageObserver.observe(this.element, {
      childList: true,
      subtree: true,
    });
  }

  // scroll to the bottom of the chatbox
  scrollToBottom() { 
    this.element.scrollTop = this.element.scrollHeight;
  }

  // style existing messages
  styleExistingMessages() {
    this.element.querySelectorAll(".message").forEach((message) => {
      this.styleMessage(message);
    });
  }

  // style nodes added to the chatbox
  styleAddedNodes(mutations) {
    mutations.forEach((mutation) => {
      mutation.addedNodes.forEach((node) => {
        // nodetype of 1 is an element
        if (Node.nodeType === 1) {
          this.styleMessage(node);
        }
      });
    });
  }

  // style a message node
  styleMessage(node) {
    let messageNode = this.getMessageNode(node);
    if (!messageNode) return;

    const userId = messageNode.dataset.userId; // MAY HAVE TO MODIFY
    const messageBody = messageNode.querySelector(".message_body");

    this.applyStyle(userId, messageBody); // MAY HAVE TO MODIFY
  }

  // get the message node from a node
  getMessageNode(node) {
    return node.closest(".message") || node.querySelector(".message");
  }

  // apply style to a message body
  applyStyle(userId, messageBody) {
    if (userId === this.currentUserIdValue) {
      messageBody.classList.add("bg-primary", "text-light"); // bootstrap primary background color and light text color
    } else {
      messageBody.classList.add(
        "border",
        "border-primary",
        "text-dark"
      ); // bootstrap border class, primary border color, and dark text color
    }
  }
}

// app/assets/javascripts/channels/app.js

//= require cable
//= require_self
//= require_tree

this.app = {};

App.cable = ActionCable.createConsumer();

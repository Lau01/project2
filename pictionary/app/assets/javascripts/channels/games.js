// app/assets/javascripts/channels/games.js

//= require cable
//= require_self
//= require_tree

this.app = {};

App.cable = ActionCable.createConsumer();

// Establish the socket connection (client-side)
// Code from: https://blog.heroku.com/real_time_rails_implementing_websockets_in_rails_5_with_action_cable

//= require cable
//= require_self
//= require_tree

this.app = {};

// Note: the socket URI does not need to be passed through here
// as it has been set-up in config/environment/
App.cable = ActionCable.createConsumer();

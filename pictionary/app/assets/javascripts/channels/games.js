// app/assets/javascripts/channels/games.js

$(document).ready(function(){
  // We need to wrap the websockets setup code in a document.ready because
  // it's going to rely on some JS variables we define in the body of the page,
  // after this script has loaded: in particular, 'role'

  App.games = App.cable.subscriptions.create('GamesChannel', {

    received: function(data) {
      // $("#game-status").text(data);
      console.log('WS MESSAGE', data);
    },

    connected: function(){
      if( role === 'guesser' ){
        App.games.perform('guesser_ready', {game_id: 2});
      }
    },

    // renderStatus: function
  });

});

$(document).ready(function(){
  // We need to wrap the websockets setup code in a document.ready because
  // it's going to rely on some JS variables we define in the body of the page,
  // after this script has loaded: in particular, 'role'

  // Only load websockets js on the games play page
  if($('body.games.play').length) {

    App.games = App.cable.subscriptions.create('GamesChannel', {

      connected: function() {
        if(role === 'guesser') {
          App.games.perform('guesser_ready', {game_id: 2});
        }
      },

      received: function(data) {

        if(data.status === 'playing') {
          // Clear the drawer's canvas before the game starts
          const canvas = document.getElementById("canvasElement");
          const ctx = canvas.getContext("2d");
          ctx.clearRect(0, 0, canvas.width, canvas.height);

          console.log('canvasApp', canvasApp);

          $('h2.drawer_wait').hide();
          $('h2.drawer_play').show();

          // TIMER
          // setTimeout(function() {alert("Hello");}, 5000);
        }

        //else if (data.status == 'finished') {
        //
        // }

        //else if (data.status == 'cancelled') {
        //
        // }

        // USE setInterval instead of click handler

        console.log('GAME.JS MESSAGE', data.status);
      },
    });

  } // end test for body.games.play

});

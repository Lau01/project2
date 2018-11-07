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

        if(data.status) {
          // Clear the drawer's canvas before the game starts
          // const canvas = document.getElementById("canvasElement");
          // const ctx = canvas.getContext("2d");
          // ctx.clearRect(0, 0, canvas.width, canvas.height);
          canvasApp.clearCanvas();

          $('h2.drawer_wait').hide();
          $('h2.drawer_play').show();

          // TIMER
          // setTimeout(function() {alert("Hello");}, 5000);
        }

        if(data.position) {
          if(data.event === 'click') {
            canvasApp.setPosition(data.position.xPos, data.position.yPos);
            canvasApp.drawOnClick();
          } else if (data.event === 'mouseenter') {
            canvasApp.setPosition(data.position.xPos, data.position.yPos);
          } else {
            canvasApp.drawOnMove(data.userInput, data.position.xPos, data.position.yPos)
          }
        }

        if(data.clear) {
          canvasApp.clearCanvas();
        }

        //else if (data.status == 'finished') {
        //
        // }

        //else if (data.status == 'cancelled') {
        //
        // }
      },
    });

  } // end test for body.games.play

});

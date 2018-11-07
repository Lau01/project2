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
          if(data.status === 'playing') {
            // Clear the drawer's canvas before the game starts
            canvasApp.clearCanvas();

            // Change the text displayed on the drawer's page
            $('h2.drawer_wait').hide();
            $('h2.drawer_play').show();

            // Set and display a countdown timer for both players
            let timeLeft = 30;

            const gameTimer = setInterval(function() {
              $('div.timer').text(timeLeft);

              if(timeLeft <= 0 && role === 'guesser') {
                clearInterval(gameTimer);
                gameOver('lost');
              }

              timeLeft -= 1;
            }, 1000);
          } else if (data.status === 'finished') {
            // NEED TO REDIRECT
            console.log('FINISHED:', data);
          } else {
            // Catch any waiting or cancelled games
          }

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
      },
    });

  } // end test for body.games.play

});

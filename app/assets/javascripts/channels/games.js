$(document).ready(function(){
  // We need to wrap the websockets setup code in a document.ready because
  // it's going to rely on some JS variables we define in the body of the page,
  // after this script has loaded: in particular, 'role'

  // Only load websockets js on the games play page
  if($('body.games.play').length) {

    App.games = App.cable.subscriptions.create('GamesChannel', {

      connected: function() {
        if(role === 'guesser') {
          App.games.perform('guesser_ready', {game_id: currentGame});
        }
      },

      received: function(data) {

        // Handles messages about the game's status
        if(data.status) {
          if(data.status === 'playing') {
            // Clear the drawer's canvas before the game starts
            canvasApp.clearCanvas();

            // Change the text displayed on the drawer's page
            $('h2.drawer_wait').hide();
            $('h2.drawer_play').show();

            // Set and display a countdown timer for both players
            let timeLeft = 30;
            //
            const gameTimer = setInterval(function() {
              $('div.timer').text(`Time left: ${timeLeft}`);

              // If the countdown timer reaches zero for the guesser,
              // then record a loss and move onto the result page
              if(timeLeft <= 0) {
                $('div.timer').empty();
                clearInterval(gameTimer);
                if(role === 'guesser') {
                  gameOver('lost');
                }
              }
              timeLeft -= 1;
            }, 1000);
          } else if (data.status === 'finished') {
            setTimeout(function() {window.location.href = gameOverRedirectURL}, 3000);
          } else {
            // Catch any waiting or cancelled games
          }
        }

        // Handles messages about the drawing
        if(data.position) {
          if(data.event === 'click') {
            canvasApp.setPosition(data.position.xPos, data.position.yPos);
            canvasApp.drawOnClick();
          } else if (data.event === 'mouseenter') {
            console.log('mouseenter SETPOS!', data.position);
            canvasApp.setPosition(data.position.xPos, data.position.yPos);
            console.log('after:', canvasApp.pos);
          } else {
            canvasApp.drawOnMove(data.userInput, data.position.xPos, data.position.yPos)
          }
        }

        // Handles a clear canvas message
        if(data.clear) {
          canvasApp.clearCanvas();
        }
      },
    });

  } // $(body.games.play)
});

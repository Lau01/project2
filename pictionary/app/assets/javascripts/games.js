$( document ).ready(function() {


  $('.guessButton').on('click', function(){
    if (currentWord === $('.guessField').val()) {
      // ajax POST to games. change result column to 'Win' or 'Lose' ??
      $.ajax({
        type: "POST",
        url: `localhost:3000/game/result/${gameId}`,
        data: {result: 'win'},
      })
      .done() // save image and redirect to result page???
    }
  }) //click


}); //ready

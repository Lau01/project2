$(document).ready(function() {

  $('#canvasContainer').append("<canvas id='canvasElement'></canvas>");
  const canvas = document.getElementById("canvasElement");
  const ctx = canvas.getContext("2d");

  let offsetX = $('#canvasElement').offset().left;
  let offsetY = $('#canvasElement').offset().top;

  console.log(offsetX)
  // resize canvas when window is resized
  function resizeWindow() {
    ctx.canvas.width = window.innerWidth;
    ctx.canvas.height = window.innerHeight;
    offsetX = $('#canvasElement').offset().left;
    offsetY = $('#canvasElement').offset().top;
  };

  resizeWindow();

  // last known x, y pos
  const canvasApp = {
    pos: {
      x: 0,
      y: 0
    },

    setPosition: function(event) {
      this.pos.x = event.pageX - offsetX;
      this.pos.y = event.pageY - offsetY;
    },

    drawOnMove: function(event) {

      if (event.which !== 1) return; //which === 1 when left click down

      ctx.beginPath(); // begin the drawing path

      ctx.lineWidth = 5; // width of line
      ctx.lineCap = "round"; // rounded end cap

      ctx.moveTo(this.pos.x, this.pos.y); // from position
      this.setPosition(event); // set new pos
      ctx.lineTo(this.pos.x, this.pos.y); // to position

      ctx.stroke(); // draw
    },

    // for initial click, draw a circle
    drawOnClick: function(event) {
      ctx.beginPath();
      ctx.arc(this.pos.x, this.pos.y, 0.5, 0, 2*Math.PI); // draws circle
      ctx.fill(); // fill circle
      ctx.stroke();
    }
  }; //canvasApp

  // change canvas to window height/width
  $(window).resize(function() {
    resizeWindow();
  });

  // mouse down draws a single circle and sets last known x,y pos as the clicked pos
  $('#canvasElement').mousedown(event => {
    canvasApp.setPosition(event);
    canvasApp.drawOnClick(event);
  });

  // mouse enter sets last known x,y pos as the entered pos
  $('#canvasElement').mouseenter(event => {
    canvasApp.setPosition(event)
  });

  // on mouse move draws a line from last known x,y to new x,y pos set in the drawOnMove function
  $('#canvasElement').mousemove(event => {
    canvasApp.drawOnMove(event);
  });

  $('#nextButton').on('click', function() {
    let dataURL = canvas.toDataURL();

    // $.ajax({
    //   type: "POST",
    //   url: "",
    //   data: {
    //      image: dataURL
    //   }
    // })
    // .done(function() {
    //   console.log('saved');
    // });
  });

  $('#clearButton').on('click', function() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
  });


}); //document ready

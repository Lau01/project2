$(document).ready(() => {

  const URL = 'http://localhost:3000/words';

  const updateWordGallery = drawings => {
    $('div.gallery-container').empty();

    drawings.forEach(drawing => {
      const $imgTag = $('<img>').attr({
        src: drawing.image,
        class: 'drawing-icon',
        id: drawing.id
      });

      $('<div>')
      .attr('class', 'gallery-drawing')
      .append($imgTag)
      .appendTo($('div.gallery-container'));
    });
  };

  /////  WORD LIST ITEM CLICK HANDLER
  $('li.word').on('click', function() {
    const word_id = $(this).val();
    const word_url = `${URL}/${word_id}`;
    $.getJSON(word_url)
    .done(response => updateWordGallery(response))
    .fail(console.warn);
  });

  /////  GALLERY IMAGE CLICK HANDLER
  $(document).on('click', 'img.drawing-icon', function() {
    $('div.lightbox-container').show();
  });

}); // $(document).ready

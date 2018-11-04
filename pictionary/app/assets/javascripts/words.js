$(document).ready(() => {

  const URL = 'http://localhost:3000/words';

  const updateWordGallery = drawings => {
    $('div.gallery-container').empty();

    drawings.forEach(drawing => {
      const $imgTag = $('<img>').attr('src', drawing.image);
      const $aTag = $('<a>').attr('href', `/drawings/${drawing.id}`).append($imgTag);
      const $divTag = $('<div class="drawing">').append($aTag);
      $('div.gallery-container').append($divTag);
    });
  };

  $('li.word').on('click', function() {
    const word_id = $(this).val();
    const word_url = `${URL}/${word_id}`;
    $.getJSON(word_url)
    .done(response => updateWordGallery(response))
    .fail(console.warn);
  });

}); // $(document).ready

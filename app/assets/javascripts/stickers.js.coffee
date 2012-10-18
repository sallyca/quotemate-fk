jQuery ->
  $('#new-sticker').fancybox
    autoDimensions: false
    width: 630
    autoDimensions: true

  $("#sticker-quote-complete").autocomplete
    source: $("#sticker-quote-complete").data('autocomplete-source')

  i = 1
  $("#create-sticker").click ->
    $("<div />",
      class: "sticker-back"
      id: "sticker" + i
    ).append($("<label />",
      id: "name" + i
    )).appendTo "#sticker-board"
    i++
  
  Draw = (scope) ->
    new_sticker = scope.find("#new-sticker")
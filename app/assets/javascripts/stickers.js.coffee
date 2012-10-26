jQuery ->
  $('#new-sticker').fancybox
    autoDimensions: false
    width: 630
    autoDimensions: true

  $("#sticker-quote-complete").autocomplete
    source: $("#sticker-quote-complete").data('autocomplete-source')

  i = 1
  $("#create-sticker").click(e) ->
    $("<div />",
      class: "sticker-back"
      id: "sticker" + i
    ).append($("<label />",
      id: "name" + i
    ).text($("#sticker-quote-complete").text()
    )).appendTo "#sticker-board"
    i++
    $('#new_sticker').submit();
    
  
  Draw = (scope) ->
    new_sticker = scope.find("#new-sticker")

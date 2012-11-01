jQuery ->
  $('#new-sticker').fancybox
    autoDimensions: false
    width: 630
    autoDimensions: true

  $("#sticker-quote-complete").autocomplete
    source: $("#sticker-quote-complete").data('autocomplete-source')

  $("#create-sticker").click ->
    $('#new_sticker').submit();
  
  Draw = (scope) ->
    new_sticker = scope.find("#new-sticker")

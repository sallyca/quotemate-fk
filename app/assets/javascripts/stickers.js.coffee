# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#new-sticker').fancybox
    autoDimensions: false
    width: 630
    autoDimensions: true

   $("#sticker-quote-complete").autocomplete
    source: $("#sticker-quote-complete").data('autocomplete-source')

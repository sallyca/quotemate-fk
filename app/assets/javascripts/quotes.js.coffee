jQuery ->
  $("#book-notice").click ->
    $("#book-field-hidden").show()
  $("#tag-notice").click ->
    $("#tag-field-hidden").show()
  $("#quote_book_title").autocomplete
    source: $("#quote_book_title").data('autocomplete-source')


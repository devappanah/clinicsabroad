jQuery ->
  $('div.shop span.review').raty
    path: '/assets/raty'
    readOnly: true
    score: ->
      $(this).attr('data-score')

  $('#cast-score').raty
    path: '/assets/raty'
    click: (score, evt) ->
      $('#review_score').val(score)
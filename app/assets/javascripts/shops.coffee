jQuery ->
  $('div.shop span.review').raty
    path: '/assets/images/raty'
    readOnly: true
    score: ->
      $(this).attr('data-score')

  $('#cast-score').raty
    path: '/assets/images/raty'
    click: (score, evt) ->
      $('#review_score').val(score)
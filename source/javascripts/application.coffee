$ ->

  # main navigation toggle
  $header = $('#header')

  $header.find('a.navigation-toggle').on 'click', (e) ->
    e.preventDefault()
    $header.find('.navigation').toggle()

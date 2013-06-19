$ ->

  $header           = $('#header')
  $body             = $('body')
  $ewb              = $('#eurucamp-week-bar')
  eurucampBarHeight = if $ewb.length then $ewb.height() - 5 else 0 # 5px for the foot

  $header
    # main navigation toggle
    .on 'click', 'a.navigation-toggle', (e) ->
      e.preventDefault()
      $header.find('.navigation').toggle()

    # scroll to, animated
    .on 'click', '.navigation a', (e) ->
      e.preventDefault()
      targetOffset = $('#' + @href.split('#')[1]).offset().top
      $body.animate
        scrollTop: targetOffset - eurucampBarHeight, 700

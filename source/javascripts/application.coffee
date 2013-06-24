jumpTo = window.location.hash.replace('#', '')
window.location.hash = ''

$ ->

  $header           = $('#header')
  $body             = $('body')
  eurucampBarHeight = 40

  scrollToID = (id) ->
    targetOffset = $("##{id}").offset().top
    offset       = targetOffset - eurucampBarHeight
    $body.animate scrollTop: offset, 700

  # scroll to anchor if given when page loaded
  setTimeout(scrollToID, 1500, jumpTo) if $("##{jumpTo}").length

  $header
    # main navigation toggle
    .on 'click', 'a.navigation-toggle', (e) ->
      e.preventDefault()
      $header.find('.navigation').toggle()

    # scroll to, animated
    .on 'click', '.navigation a', (e) ->
      e.preventDefault()
      scrollToID(@href.split('#')[1])


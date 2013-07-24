jumpTo = window.location.hash.replace('#', '')
window.location.hash = ''

eurucampBarHeight = 40

$.fn.scrollTo = (duration = 700)->
  @each ->
    targetOffset = $(@).offset().top
    offset       = targetOffset - eurucampBarHeight
    $('body').animate scrollTop: offset, duration

$ ->

  if location.pathname in ['/', 'index', 'index.html']
    $header           = $('#header')
    $body             = $('body')

    # scroll to anchor if given when page loaded
    setTimeout((->$("##{jumpTo}").scrollTo()), 1500) if $("##{jumpTo}").length

    $header
      # main navigation toggle
      .on 'click', 'a.navigation-toggle', (e) ->
        e.preventDefault()
        $header.find('.navigation').toggle()

      # scroll to, animated
      .on 'click', '.navigation a', (e) ->
        e.preventDefault()
        $("##{@href.split('#')[1]}").scrollTo()

    # TODO: refactor
    $speakers = $('#speakers')
    $speakers.on 'click', '.speakers li a', (e)->
      e.preventDefault()
      e.stopPropagation()
      $speakers.addClass('show-details')
      $speakers
        .find('.details .reveal').removeClass('reveal')
        .end()
        .find(".details ##{$(@).data('details')}").addClass('reveal')
        .find('a.close').one 'click', (e)->
          e.preventDefault()
          $speakers.removeClass('show-details')
          $speakers.scrollTo(500)

      setTimeout (-> $speakers.find('ul.details').scrollTo(500)), 250


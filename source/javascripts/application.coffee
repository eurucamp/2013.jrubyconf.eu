# Store hash if given and remove from URL to
# prevent default behavior
jumpTo               = window.location.hash.replace('#', '')
window.location.hash = ''

# Height of eurucamp week bar
ECB_HEIGHT           = 40

# jQuery plugin: Scroll to element
$.fn.scrollTo = (duration = 700)->
  @each ->
    targetOffset = $(@).offset().top
    offset       = targetOffset - ECB_HEIGHT
    $('body, html').animate scrollTop: offset, duration

$ ->

  # Functionality for main page only:
  if location.pathname in ['/', 'index', 'index.html']
    $header           = $('#header')
    $body             = $('body')
    $speakers         = $('#speakers')

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

    $speakers
      # show speaker details
      .on 'click', '.speakers li a', (e)->
        e.preventDefault()
        $speakers
          .addClass('show-details')
          .find('.details .reveal').removeClass('reveal').end()
          .find(".details ##{$(@).data('details')}").addClass('reveal')
        setTimeout (-> $speakers.find('ul.details').scrollTo(500)), 250

      # hide speaker details when close button clicked
      .on 'click', '.details a.close', (e)->
        e.preventDefault()
        $speakers.removeClass('show-details').scrollTo(500)

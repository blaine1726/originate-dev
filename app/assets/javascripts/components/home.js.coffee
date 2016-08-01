React = require 'react'

# TODO: Be sure to kill off all of the tweens when not using them

@Home = React.createClass
  getInitialState: ->
    scrollPosition: 0
    title: null
    titleTween: null
    text: null
    textTween: null
    line: null
    topNav: null
    onWheel: null

  componentDidMount: ->
    document.body.scroll = 'no'
    window.addEventListener 'wheel', @handleScroll
    window.addEventListener 'DOMMouseScroll', @preventDefault, false

    # Prevent scrolling on all of the browsers/platforms
    window.onwheel = @preventDefault #modern standard
    window.onmousewheel = document.onmousewheel = @preventDefault #old browsers
    window.ontouchmove = @preventDefault #mobile

    @setState title: document.getElementById 'home-title'
    @setState text: document.getElementById 'home-text'
    @setState titleTween: TweenLite.to("#home-title", .4,
      {right: 0, opacity: 1, paused: yes, delay: .3}, ease:Power2.easeInOut)
    @setState textTween: TweenLite.to('#home-text', .5,
      {right: 0, opacity: 1, paused: yes, delay: .3}, ease:Power2.easeInOut)
    @setState line: TweenLite.to('.centered-line', .4,
      {width: "90%", paused: yes, delay: .5}, ease:Expo.easeInOut)
    @setState topNav: TweenLite.to('.top-nav', .7,
      {opacity: 1, paused: yes, delay: .3}, ease: Expo.easeInOut)
    @animatePage 'next'

  componentWillUnmount: ->
    window.removeEventListener 'wheel', @handleScroll
    window.removeEventListener 'DOMMouseScroll', @preventDefault, false
    window.onwheel = null
    window.onmousewheel = document.onmousewheel = null
    window.ontouchmove = null
    document.body.scroll = 'yes'

  incrementPage: ->
    @setState scrollPosition: @state.scrollPosition + 1
    @animatePage 'next'

  preventDefault: (e) ->
    e = e || window.event
    if (e.preventDefault)
        e.preventDefault()
    e.returnValue = false

  handleScroll: (event) ->
    if Math.abs(event.deltaY) > 3
      if !@state.scrolling
        direction = null
        if (event.deltaY > 0)
          direction = "next"
          if @state.scrollPosition == 2
            @setState scrollPosition: 1
          else
            @setState scrollPosition: (@state.scrollPosition + 1)
        else
          direction = "previous"
          if @state.scrollPosition == 1 or @state.scrollPosition == 0
            @setState scrollPosition: 2
          else
            @setState scrollPosition: (@state.scrollPosition - 1)
        @setState scrolling: yes
        @setState direction: direction
        @setScrollable direction
        # TODO: Check to see if I should even have this passing in the direction

  setScrollable: (direction) ->
    # Delay for 1.5 seconds to make sure scrolling doesn't happen before
    # the animations are finished
    setTimeout ( =>
      @setState scrolling: no
    ), 1500
    @animatePage direction

  playGenericContent: ->
    @state.titleTween.play()
    @state.textTween.play()
    @state.line.play()
    @state.topNav.play()

  reverseGenericContent: ->
    @state.titleTween.reverse()
    @state.textTween.reverse()
    @state.line.reverse()

  animatePageZero: ->
    # Direction doesn't actually matter for this one
    $('.page-intro').typed({
      strings: ['extraodinary', 'creative', 'impactful']
      typeSpeed: 1})
    setTimeout ( =>
      if @state.scrollPosition == 0
        @incrementPage()
    ), 4000

  animatePageOne: ->
    TweenLite.to('.full-page', .6, {top: '100%'}, ease:Expo.easeOut)
    @reverseGenericContent()
    setTimeout ( =>
      @state.title.innerHTML = 'AI-Native'
      @state.text.innerHTML = "We're exploring the depths and possibilities of AI in every day technologies"
      @playGenericContent()
    ), 500

  animatePageTwo: ->
    @reverseGenericContent()
    setTimeout ( =>
      @state.title.innerHTML = "People"
      @state.text.innerHTML = "Our people are the driving force behind our innovation"
      @playGenericContent()
    ), 500

  animatePage: (direction) ->
    if @state.scrollPosition == 2
      @animatePageTwo()
    else if @state.scrollPosition == 1
      # if direction == "previous" then @reversePageTwo()
      @animatePageOne()
    else if @state.scrollPosition == 0
      @animatePageZero()

  render: ->
    {a, div, img, svg, g, path, video, source, p, span} = React.DOM
    div
      className: 'home-outer'
      React.createElement TopNav, null
      div className: 'full-page',
        span className: 'home-typed-constant', 'WE ARE '
        span className: 'page-intro', ''
      img
        className: 'scroll-down clickable'
        src: @props.assets.down
        alt: 'Scroll Down'
        onClick: => @incrementPage()
      div className: 'home-content',
        div className: 'home-middle',
          div className: 'home-inner',
            div className: 'centered-line', ''
            div
              id: 'home-title'
            div
              id: 'home-text'

module.exports = @Home

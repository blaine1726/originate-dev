React = require 'react'

@Home = React.createClass
  getInitialState: ->
    scrollPosition: 0
    scrolling: no
    animation: null
    parallax: null

  componentDidMount: ->
    @setState animation: document.getElementById('home-animation')
    @setState parallax: document.getElementById('parallax-scroll')
    document.body.scroll = 'no'
    window.addEventListener 'wheel', @handleScroll
    window.addEventListener 'DOMMouseScroll', @preventDefault, false
    # Prevent scrolling on all of the browsers/platforms
    window.onwheel = @preventDefault #modern standard
    window.onmousewheel = document.onmousewheel = @preventDefault #old browsers
    window.ontouchmove = @preventDefault #mobile

  preventDefault: (e) ->
    e = e || window.event
    if (e.preventDefault)
        e.preventDefault()
    e.returnValue = false

  handleScroll: (event) ->
    if !@state.scrolling
      @setScrollable()
      @setState scrolling: yes
      @setState scrollPosition: (@state.scrollPosition + 1) % 5

  setScrollable: ->
    # Delay for 2 seconds to make sure scrolling doesn't happen before
    # the animations are finished
    setTimeout ( =>
      @setState scrolling: no
    ), 1500
    @handlePageFlip()

  animatePageOne: ->
    # Fade out the initial content
    TweenLite.to(@state.parallax, .5, {opacity: 0})
    TweenLite.to("#Logo", .5,
      {fill: "#000000", width: "160px"},
      ease:Power2.easeInOut)
    TweenLite.to(".home-text", .5, {left: "calc(50% - 80px)"})
    # setTimeout ( ->
    #   TweenLite.to("#Logo", .5, {marginLeft: "50%"}, ease:Power2.easeInOut)
    # ), 200
    TweenLite.to(".inner-home", .5, {top: "60px"})
    setTimeout ( =>
      @state.parallax.removeChild @state.animation
    ), 700
    setTimeout ( ->
      TweenLite.fromTo('.content1', .5,
        {right: '100%'},
        {right: 0},
        ease:Expo.easeOut)
      TweenLite.to("#Logo", .5, {fill: "#ffffff"}, ease:Expo.easeOut)
      line = document.createElement 'div'
      line.className = 'centered-line'
      document.getElementById('home-1').appendChild line
    ), 500
    setTimeout ( ->
      TweenLite.to('.centered-line', .3, {width: "75%"}, ease:Power2.easeOut)
      TweenLite.to('.home-title', .1, {opacity: 1})
      TweenLite.to('.home-typed-outer', .1, {opacity: 1})
    ), 1000
    setTimeout ( ->
      $('.home-typed').typed({
        strings: ['are AI-Native',
        'take ownership of our partner projects',
        "don't sell time, we sell talent and solutions",
        "are entrepeneurs",
        "are designers",
        "are programmers",
        "offer 150 experts to work on your problems",
        "are Originate"],
        typeSpeed: 1})
    ), 1300

  handlePageFlip: ->
    if @state.scrollPosition == 1
      @animatePageOne()
    if @state.scrollPosition == 0
      @state.parallax.appendChild @state.animation
      TweenLite.to(@state.parallax, 1, {opacity: 1})

  render: ->
    {a, div, img, svg, g, path, video, source, p, span} = React.DOM
    div
      className: 'home-outer'
      div
        className: 'parallax'
        id: 'parallax-scroll'
        div
          className: 'inner-home parallax-bg'
          id: 'home-animation'
      div className: 'inner-home',
        div className: 'home-text',
          React.createElement Logo, null
      div
        className: 'home-content'
        id: 'home-1'
        div className: 'content1', ''
        div className: 'home-title', 'IDENTITY'
        div className: 'home-typed-outer',
          span className: 'home-typed-constant', 'WE '
          span className: 'home-typed', ''
        # div className: 'slide-left', 'Left Content'
        # div className: 'slide-right', 'Right Content'

module.exports = @Home

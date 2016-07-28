React = require 'react'

# TODO: Be sure to kill off all of the tweens when not using them

@Home = React.createClass
  getInitialState: ->
    scrollPosition: 0
    scrolling: no
    animation: null
    parallax: null
    showGoDown: yes
    line: null
    fadeInitial: null
    logo: null
    homeText: null
    homeInner: null
    content1: null
    logoLite: null
    homeTitle: null
    homeType: null
    leftMenu: null
    item1: null

  componentDidMount: ->
    parallax = document.getElementById('parallax-scroll')
    @setState animation: document.getElementById('home-animation')
    @setState parallax: parallax
    document.body.scroll = 'no'
    window.addEventListener 'wheel', @handleScroll
    window.addEventListener 'DOMMouseScroll', @preventDefault, false
    # Prevent scrolling on all of the browsers/platforms
    window.onwheel = @preventDefault #modern standard
    window.onmousewheel = document.onmousewheel = @preventDefault #old browsers
    window.ontouchmove = @preventDefault #mobile
    # Need to stop the propogation of each of the elements here
    line = document.createElement 'div'
    line.className = 'centered-line'
    @state.line = line
    @state.fadeInitial = TweenLite.to(parallax, .5, {opacity: 0, paused: yes})
    @state.logo = TweenLite.to("#Logo", .5, {fill: "#000000", width: "160px", paused: yes},
      ease:Power2.easeInOut)
    @state.homeText = TweenLite.to(".home-text", .5, {left: "calc(50% - 80px)", paused: yes})
    @state.homeInner = TweenLite.to(".inner-home", .5, {top: "60px", paused: yes})
    @state.content1 = TweenLite.to('.content1', .5, {right: 0, delay: 0.5, paused: yes},
      ease:Expo.easeOut)
    @state.logoLite = TweenLite.to("#Logo", .5, {fill: "#ffffff", paused: yes}, ease:Expo.easeOut)
    @state.homeTitle = TweenLite.to('.home-title', .1, {opacity: 1, delay: 1, paused: yes})
    @state.homeType = TweenLite.to('.home-typed-outer', .1, {opacity: 1, delay: 1, paused: yes})
    @state.leftMenu = TweenLite.to('.left-menu', 1, {left: 10, delay: 0.5, paused: yes}, ease:Circ)
    @state.item1 = TweenLite.to('.item1', 1.5, {textDecoration: "line-through", delay: 0.5, paused: yes}, ease:Power2)
    @animatePage 'next'

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
          @setState scrollPosition: (@state.scrollPosition + 1) % 3
        else
          direction = "previous"
          @setState scrollPosition: (@state.scrollPosition - 1) % 3
        @setState scrolling: yes
        @setScrollable direction

  setScrollable: (direction) ->
    # Delay for 2 seconds to make sure scrolling doesn't happen before
    # the animations are finished
    setTimeout ( =>
      @setState scrolling: no
    ), 1500
    @animatePage direction

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
    TweenLite.to('.full-page', .4, {top: '100%'}, ease:Expo.easeOut)
    @state.parallax.appendChild @state.animation
    TweenLite.to(@state.parallax, 1, {opacity: 1})

  animatePageTwo: ->
    @state.fadeInitial.play()
    @state.logo.play()
    @state.homeText.play()
    @state.homeInner.play()
    setTimeout ( =>
      @state.parallax.removeChild @state.animation
    ), 700
    @state.content1.play()
    @state.logoLite.play()
    setTimeout ( =>
      document.getElementById('home-1').appendChild @state.line
      TweenLite.to('.centered-line', .3, {width: "75%", delay: 0.5}, ease:Power2.easeOut)
    ), 500
    @state.homeTitle.play()
    @state.homeType.play()
    # Abstract this out into its own method!
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
    @state.leftMenu.play()
    @state.item1.play()

  reversePageTwo: ->
    @state.fadeInitial.reverse()
    @state.logo.reverse()
    @state.homeText.reverse()
    @state.homeInner.reverse()
    setTimeout ( =>
      @state.parallax.appendChild @state.animation
    ), 700
    @state.content1.reverse()
    @state.logoLite.reverse()
    setTimeout ( =>
      document.getElementById('home-1').removeChild @state.line
    ), 500
    @state.homeTitle.reverse()
    @state.homeType.reverse()
    @state.leftMenu.reverse()
    @state.item1.reverse()

  animatePage: (direction) ->
    console.log @state.scrollPosition
    if @state.scrollPosition == 2
      @animatePageTwo()
    else if @state.scrollPosition == 1
      if direction = "previous" then @reversePageTwo()
      @animatePageOne()
    else if @state.scrollPosition == 0
      @animatePageZero()

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
      div className: 'full-page',
        span className: 'home-typed-constant', 'WE ARE '
        span className: 'page-intro', ''
      div className: 'inner-home',
        div className: 'home-text',
          React.createElement Logo, null
      img
        className: 'scroll-down clickable'
        src: @props.assets.down
        alt: 'Scroll Down'
        onClick: => @incrementPage()
      div
        className: 'home-content'
        id: 'home-1'
        div className: 'content1', ''
        div className: 'home-title', 'IDENTITY'
        div className: 'home-typed-outer',
          span className: 'home-typed-constant', 'WE '
          span className: 'home-typed', ''
      div className: 'left-menu',
        div className: 'left-menu-item item1', 'Identity'
        div className: 'left-menu-item item2', 'AI-Native'
        div className: 'left-menu-item item3', 'Partners'
        div className: 'left-menu-item item4', 'Opportunity'
        # div className: 'slide-left', 'Left Content'
        # div className: 'slide-right', 'Right Content'

module.exports = @Home

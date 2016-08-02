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
    direction: 'next'

  componentDidMount: ->
    document.body.scroll = 'no'
    window.addEventListener 'wheel', @handleScroll
    window.addEventListener 'touchmove', @handleScroll
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
    if @state.scrollPosition == 2
      @setState scrollPosition: 1
    else
      @setState scrollPosition: @state.scrollPosition + 1
    # Make the call synchronous
    setTimeout ( =>
      @animatePage 'next'
    ), 0

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
      TweenLite.to('.gear', .6, {opacity: .8, delay: .5}, ease:Linear.easeInOut)
      TweenMax.to('#gear1', 20, {rotationZ: "360deg", repeat: -1, transformOrigin:"180px 180px", delay: .5}, ease:Linear.easeInOut)
      TweenMax.to('#gear2', 20, {rotationZ: "-360deg", repeat: -1, transformOrigin:"180px 180px", delay: .5}, ease:Linear.easeInOut)
      TweenMax.to('#gear3', 20, {rotationZ: "360deg", repeat: -1, transformOrigin:"180px 180px", delay:.5}, ease:Linear.easeInOut)
    ), 500

  animatePageTwo: ->
    @reverseGenericContent()
    if @state.direction == "next"
      TweenLite.to('.gear', .4, {opacity: 0})
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
      div className: 'gears',
        svg
          version: "1.1"
          className: 'gear'
          id: "gear-outer"
          xmlns: "http://www.w3.org/2000/svg"
          xmlns:xlink: "http://www.w3.org/1999/xlink"
          x: "0px"
          y: "0px"
          viewBox: "0 0 958 753.7"
          style:
            enableBackground: "new 0 0 958 753.7"
          xml:space: "preserve"
          path
            id: 'gear1'
            d: "M360.5,594.8v-43.2l-40.6-14.4c-3.4-13.2-8.7-25.6-15.4-37.1l0.1-0.1l18.5-38.9l-30.5-30.5l-38.9,18.5l-0.1,0.1
            	c-11.5-6.8-23.9-12-37.1-15.4l-14.4-40.6h-43.2l-14.4,40.6c-13.2,3.4-25.6,8.7-37.1,15.4l-0.1-0.1l-38.9-18.5l-30.5,30.5l18.5,38.9
            	l0.1,0.1c-6.8,11.5-12,23.9-15.4,37.1L0.5,551.6v43.2l40.6,14.4c3.4,13.2,8.7,25.6,15.4,37.1l-0.1,0.1l-18.5,38.9l30.5,30.5
            	l38.9-18.5l0.1-0.1c11.5,6.8,23.9,12,37.1,15.4l14.4,40.6h43.2l14.4-40.6c13.2-3.4,25.6-8.7,37.1-15.4l0.1,0.1l38.9,18.5l30.5-30.5
            	l-18.5-38.9l-0.1-0.1c6.8-11.5,12-23.9,15.4-37.1L360.5,594.8z M180.5,645.2c-39.8,0-72-32.2-72-72c0-39.8,32.2-72,72-72
            	s72,32.2,72,72C252.5,613,220.3,645.2,180.5,645.2z"
          path
            id: 'gear2'
            d: "M490.9,217.5l-16.4-41.2l-44.1,1.6c-8.3-11.3-18-21.2-28.8-29.5l0-0.1l2.9-44.1l-40.7-17.5l-30,32.4l0,0.1
            	c-13.5-2.1-27.4-2.4-41.2-0.7l-29.1-33.2l-41.2,16.4l1.6,44.1c-11.3,8.3-21.2,18-29.5,28.8l-0.1,0l-44.1-2.9l-17.5,40.7l32.4,30
            	l0.1,0c-2.1,13.5-2.4,27.4-0.7,41.2l-33.2,29.1l16.4,41.2l44.1-1.6c8.3,11.3,18,21.2,28.8,29.5l0,0.1l-2.9,44.1l40.7,17.5l30-32.4
            	l0-0.1c13.5,2.1,27.4,2.4,41.2,0.7l29.1,33.2l41.2-16.4l-1.6-44.1c11.3-8.3,21.2-18,29.5-28.8l0.1,0l44.1,2.9l17.5-40.7l-32.4-30
            	l-0.1,0c2.1-13.5,2.4-27.4,0.7-41.2L490.9,217.5z M338.4,333.8c-37.9,15.1-80.9-3.4-96-41.4c-15.1-37.9,3.4-80.9,41.4-96
            	s80.9,3.4,96,41.4S376.3,318.8,338.4,333.8z"
          path
            id: 'gear3'
            d: "M788.6,165.5L759,134.3l-39.2,17.4c-11.5-7.2-23.8-12.6-36.6-16.2l0-0.1L670,94.5l-43-1.2l-15.4,40l0,0.1
            	c-12.9,2.9-25.5,7.7-37.4,14.2l-38.2-19.5l-31.3,29.6L522,197c-7.2,11.5-12.6,23.8-16.2,36.6l-0.1,0l-40.8,13.3l-1.2,43l40,15.4
            	l0.1,0c2.9,12.9,7.7,25.5,14.2,37.4L498.6,381l29.6,31.3l39.2-17.4c11.5,7.2,23.8,12.6,36.6,16.2l0,0.1l13.2,40.8l43,1.2l15.4-40
            	l0-0.1c12.9-2.9,25.5-7.7,37.4-14.2l38.2,19.5l31.3-29.6l-17.4-39.2c7.2-11.5,12.6-23.8,16.2-36.6l0.1,0l40.8-13.2l1.2-43l-40-15.4
            	l-0.1,0c-2.9-12.9-7.7-25.5-14.2-37.4L788.6,165.5z M693,325.3c-28.8,27.3-74.2,26-101.4-2.7c-27.3-28.8-26-74.2,2.7-101.4
            	c28.8-27.3,74.2-26,101.4,2.7S721.7,298.1,693,325.3z"
      div className: 'home-content',
        div className: 'home-middle',
          div className: 'home-inner',
            div className: 'centered-line', ''
            div
              id: 'home-title'
            div
              id: 'home-text'

module.exports = @Home

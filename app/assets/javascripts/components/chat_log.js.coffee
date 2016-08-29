React = require 'react'

@ChatLog = React.createClass
  componentDidMount: ->
    # $('#horizontal-center').css('opacity', '0');
    chat = document.getElementById 'horizontal-center'
    message = document.getElementById 'message'
    tl = new TimelineMax()
    tl.add('start')
    tl.fromTo('#loading', .4, {scale: 1}, {scale: 2}, ease:Expo.easeInOut, 'start')
      .fromTo('#loading2', .3, {scale: .8}, {scale: 1.75}, ease:Expo.easeInOut, 'start')
      .to('#loading', .3, {scale: 1, opacity: 0}, 'start+.1')
      .to('#loading2', .4, {scale: .6, opacity: 0}, 'start+.1')
      .to(chat, .5, {top: 0, opacity: 1}, 'start+.2')
      .staggerTo('.message', .3, {transform: "translateY(0)", opacity: 1}, .1, 'start+.2')
    tl.timeScale(1)

  render: ->
    {div} = React.DOM
    div className: "bot-chat-outer",
      div
        id: 'loading'
      div
        id: 'loading2'
      div
        id: 'horizontal-center', 'Blah'

module.exports = @ChatLog

React = require 'react'

@ChatLogin = React.createClass
  login: ->
    login = document.getElementById 'login-timeline'
    outer = document.getElementById 'chat-container'
    tl = new TimelineMax()
    tl.add('start')
    tl.to(login, .3, {left: "-20rem"}, 'start')
      .to(outer, .3, {bottom: "100%", borderRadius: "70%"}, 'start+.1')
    tl.timeScale(1)
    setTimeout ( ->
      window.location.href = '../chatbot/bot';
    ), 500

  render: ->
    {div, img, a} = React.DOM
    div
      className: 'chat-login'
      id: 'chat-container'
      div
        className: 'vertical-center'
        id: 'login-timeline'
        div className: 'inner-login',
          img
            className: 'chat-logo'
            src: @props.chatbot
          a
            className: 'chat-login'
            onClick: @login
            'Login'

module.exports = @ChatLogin

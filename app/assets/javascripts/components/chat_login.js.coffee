React = require 'react'

@ChatLogin = React.createClass
  render: ->
    {div, img, a} = React.DOM
    div className: 'chat-login',
      div className: 'vertical-center',
        div className: 'inner-login',
          img
            className: 'chat-logo'
            src: @props.chatbot
          a
            className: 'chat-login'
            href: 'chatbot/bot'
            'Login'

module.exports = @ChatLogin

React = require 'react'

@ChatMenu = React.createClass
  componentDidMount: ->


  render: ->
    {div, img, a} = React.DOM
    div
      id: 'chat-menu'
      a
        className: 'chat-btn 1'
        href: '../chatbot'
        'Sign Out'
      a
        className: 'chat-btn 2'
        href: '../chatbot/stats'
        'Stats'
      a
        className: 'chat-btn 3'
        href: '../chatbot/history'
        'Chat Log'
      a
        className: 'chat-btn 3'
        href: '../chatbot/bot'
        'New Chat'
      div className: 'chat-logo',
        img
          className: 'chat-botler'
          src: @props.chatbot
        div className: 'chat-header', 'Chat Botler'

module.exports = @ChatMenu

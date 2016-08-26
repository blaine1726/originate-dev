React = require 'react'

@Bot = React.createClass
  getInitialState: ->
    context: {}
    text: ""

  handleSubmit: (e) ->
    e.preventDefault()
    $.ajax
      url: '/chatbot'
      data: {'query': {'input': {'text': @state.text}}}
      method: 'POST'
    .done (response) =>
      @setState text: ""
    .fail ->
      alert 'Error sending message!'

  handleChange: (e) -> @setState text: e.target.value

  render: ->
    {div, span, pre, button, input, form} = React.DOM
    div className: 'chat-container',
      form
        id: 'chatbot'
        onSubmit: @handleSubmit
        input
          type: 'text'
          name: 'botquery'
          id: 'bot-query'
          onChange: @handleChange

module.exports = @Bot

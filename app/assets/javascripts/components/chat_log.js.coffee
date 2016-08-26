React = require 'react'

@ChatLog = React.createClass
  render: ->
    {div} = React.DOM
    div {}, 'Chat Log!'

module.exports = @ChatLog

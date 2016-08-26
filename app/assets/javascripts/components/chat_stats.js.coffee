React = require 'react'

@ChatStats = React.createClass
  render: ->
    {div} = React.DOM
    div {}, 'Chat Stats'

module.exports = @ChatStats

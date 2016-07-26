React = require 'react'

@Technology = React.createClass
  render: ->
    {div} = React.DOM
    div className: 'home-container',
      div {}, React.createElement HeaderSmall, null
      div className: 'padded-container divider',
        React.createElement HeaderMenu,
          active: 'Technology'
          header: @props.quote.quote
      div {}, 'Page Content'

module.exports = @Technology

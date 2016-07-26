React = require 'react'

@BannerTile = React.createClass
  render: ->
    {div, input} = React.DOM
    div {},
      div className: 'main-tile tile-full follow-banner',
        div className: 'follow-title', 'Sign up to receive Originate news, insights, and updates.'
        div className: 'subscribe-outer',
          div className: 'follow-sub', 'Subscribe'
          input
            type: 'text'
            className: 'follow-input'
            placeholder: 'Enter email'

module.exports = @BannerTile

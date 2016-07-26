React = require 'react'

@Solutions = React.createClass
  render: ->
    {div, img} = React.DOM
    div {},
      div className: 'home-container',
        div {}, React.createElement HeaderSmall, null
        div className: 'padded-container divider',
          React.createElement HeaderMenu,
            active: 'Solutions'
            header: @props.quote.quote
        div className: 'padded-container-small',
          div {},
            div className: 'content-title', 'Our latest solutions'
            div
              className: 'custom-dropdown-menu right'
              'Filter by sector'
              img
                className: 'menu-caret'
                src: '/images/Icons8-Ios7-Arrows-Down-4 (1).ico'
            div className: 'career-btn right border', 'View all products'
          React.createElement Tile,
            tileType: 'tile-half'
            customCSS: 'border'
          React.createElement Tile,
            tileType: 'tile-half'
            customCSS: 'border'
          React.createElement Tile,
            tileType: 'tile-full'
            customCSS: 'border'
          React.createElement Tile,
            tileType: 'tile-half'
            customCSS: 'border'
          React.createElement Tile,
            tileType: 'tile-half'
            customCSS: 'border'

module.exports = @Solutions

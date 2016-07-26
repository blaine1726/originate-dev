React = require 'react'

@Careers = React.createClass
  render: ->
    {div, img} = React.DOM
    div {},
      div className: 'home-container',
        div {}, React.createElement HeaderSmall, null
        div className: 'padded-container divider',
          React.createElement HeaderMenu,
            active: 'Careers'
            header: @props.quote.quote
        div className: 'padded-container-small divider',
          div className: 'content-title', 'Current Openings'
          div
            className: 'custom-dropdown-menu right'
            'By discipline'
            img
              className: 'menu-caret'
              src: '/assets/Icons8-Ios7-Arrows-Down-4 (1).ico'
          div
            className: 'custom-dropdown-menu right'
            'By location'
            img
              className: 'menu-caret'
              src: '/assets/Icons8-Ios7-Arrows-Down-4 (1).ico'
        [1.. 6].map ->
          div className: 'padded-container-small divider',
            img
              className: 'left-image'
              src: '/assets/DigitalWavesBlue.gif'
            div className: 'career-tile',
              div className: 'content-title', 'Design Director'
              div className: 'content-subtitle', 'SAN FRANCISCO'
              div className: 'content-centered',
                "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit"
              div className: 'bottom',
                div className: 'career-btn black-bg', 'Apply'
                div className: 'career-btn', 'Learn more'

module.exports = @Careers

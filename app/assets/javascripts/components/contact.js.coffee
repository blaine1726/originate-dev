React = require 'react'

@Contact = React.createClass
  componentDidMount: ->
    setAnimation()

  render: ->
    {div} = React.DOM
    div className: 'home-container contact',
      React.createElement HeaderSmall, null
      div className: 'padded-container divider',
        React.createElement HeaderMenu,
          active: ''
          header: 'Contact by office'
      div className: 'tile-container',
        React.createElement Tile,
          name: 'San Francisco'
          customCSS: 'animate centered-content'
          content1: ''
          coontent2: ''
          tileType: 'tile-third'
        React.createElement Tile,
          name: 'New York'
          customCSS: 'animate centered-content'
          content1: ''
          coontent2: ''
          tileType: 'tile-third'
        React.createElement Tile,
          name: 'Los Angeles'
          customCSS: 'animate centered-content'
          content1: ''
          coontent2: ''
          tileType: 'tile-third'
        React.createElement Tile,
          name: 'Las Vegas'
          customCSS: 'animate centered-content'
          content1: ''
          coontent2: ''
          tileType: 'tile-third'
        React.createElement Tile,
          name: 'Orange County'
          customCSS: 'animate centered-content'
          content1: ''
          coontent2: ''
          tileType: 'tile-third'
        React.createElement Tile,
          name: 'Silicon Valley'
          customCSS: 'animate centered-content'
          content1: ''
          coontent2: ''
          tileType: 'tile-third'
      div className: 'padded-container', ''
      div className: 'tile-container',
        React.createElement Tile,
          name: 'Github'
          customCSS: 'animate'
          tileType: 'tile-third'
        React.createElement Tile,
          name: 'Instagram'
          customCSS: 'animate'
          tileType: 'tile-third'
        React.createElement Tile,
          name: 'LinkedIn'
          customCSS: 'animate'
          tileType: 'tile-third'

module.exports = @Contact

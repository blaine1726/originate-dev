React = require 'react'

@TileUp = React.createClass
  getInitialState: ->
    hover: no

  setActive: -> @setState hover: yes

  setInactive: -> @setState hover: no

  render: ->
    {div, img, p} = React.DOM
    cssTitle = "main-tile #{@props.tileType} animate " + @props.customCSS
    div
      className: "#{cssTitle}"
      onMouseEnter: => @setActive()
      onMouseLeave: => @setInactive()
      div className: 'fullscreen-bg',
        img
          className: "bg-gif zoom #{'scale-1' if @state.hover}"
          src: @props.gif
      div className: 'slide-up-outer',
        div className: 'padded-1',
          div className: 'slide-up-title', @props.name
          p className: 'slide-up-about', "Content to display in paragraph form, it will have lots of words, but the text will give elipses when it's too long to display the whole thing"

module.exports = @TileUp

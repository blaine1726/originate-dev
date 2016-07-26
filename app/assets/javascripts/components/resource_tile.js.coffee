React = require 'react'

@ResourceTile = React.createClass
  render: ->
    {a, div, img} = React.DOM
    div
      className: "resource-tile-outer clickable animate"
      # style:
      #   color: "#{@props.res.text_color}"
      onClick: => @props.setResource @props.res
      #Can go directly to the page, but for now will do as a modal
      # a
      #   className: 'resource-link'
      #   href: "/resources/#{@props.id}"
      # img
      #   className: 'resource-bg'
      #   src: @props.res.background
      div className: 'resource-title', @props.res.title
      div className: 'resource-description', @props.res.description

module.exports = @ResourceTile

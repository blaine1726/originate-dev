React = require 'react'

@NavTile = React.createClass
  render: ->
    path = "/"
    if @props.path?
      path = share.FlowHelpers.pathFor @props.path, null
    {div, a, img} = React.DOM
    div className: 'nav-tile',
      a
        className: 'nav-tile-inner clickable'
        href: "#{path}"
        div
          className: 'link'
          if @props.icon?
            img
              className: 'nav-tile-icon'
              src: @props.icon
          else
            @props.name

module.exports = @NavTile

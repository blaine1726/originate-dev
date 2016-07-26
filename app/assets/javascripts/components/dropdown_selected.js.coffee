React = require 'react'

@DropdownSelected = React.createClass
  render: ->
    {div, svg, g, rect} = React.DOM
    div {},
      div
        id: @props.id
        className: 'selected-option'
        "#{@props.option}"
        div className: 'selected-x'
        svg
          className: 'x-svg'
          version: '1.1'
          xmlns: 'http://www.w3.org/2000/svg'
          xmlns:xlink: 'http://www.w3.org/1999/xlink'
          x: '0px'
          y: '0px'
          viewBox: '0 0 29.7 29.7'
          style:
            enableBackground: 'new 0 0 29.7 29.7'
          xml:space: 'preserve'
          onClick: => @props.deselect @props.option
          g
            id: 'Layer_1'
            rect
              x: '11.3'
              y: '-2.7'
              transform: 'matrix(0.7071 -0.7071 0.7071 0.7071 -6.1507 14.849)'
              width: '7'
              height: '35'
          g
            id: 'Layer_2'
            rect
              x: '-2.7'
              y: '11.3'
              transform: 'matrix(0.7071 -0.7071 0.7071 0.7071 -6.1507 14.849)'
              width: '35'
              height: '7'

module.exports = @DropdownSelected

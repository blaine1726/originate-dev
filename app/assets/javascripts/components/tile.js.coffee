React = require 'react'

@Tile = React.createClass
  getInitialState: ->
    hasBeenSelected: no
    selected: no

  setSelected: ->
    @setState selected: !@state.selected
    @setState hasBeenSelected: yes

  render: ->
    {div, video, source, img, p, iframe} = React.DOM
    cssTitle = "main-tile #{@props.tileType} #{'animate' if !@state.hasBeenSelected} " + @props.customCSS;
    video = @props.video;
    gif = @props.gif;
    background = null;
    div className: "#{cssTitle} #{'selected' if @state.selected}",
      # Add the flip-container here to make it flip along with 'selected'
      div
        className: "flip-container"
        onClick: => @setSelected()
        # This should be 'flipper'
        div className: '',
          # This should be 'front'
          div className: 'fullscreen-bg',
            div {},
              if video?
                video className: 'fullscreen-bg__video',
                  source
                    src: @props.video
              else if gif?
                img
                  className: "bg-gif #{'blur' if @props.blur}"
                  src: @props.gif
              else if @props.iframe?
                iframe
                  className: "bg-gif #{'blur' if @props.blur}"
                  id: 'vimeo-player'
                  src: 'https://player.vimeo.com/video/99544015?autoplay=1&loop=1&frameborder=0'
            div className: 'padded-2',
              div className: 'tile-title', @props.name
              div className: 'tile-sliding-content',
                div className: 'tile-primary-content',
                  p className: 'inner-paragraph', @props.content1
                div className: 'tile-secondary-content',
                  p className: 'inner-paragraph', @props.content2
          # div className: 'fullscreen-bg back', "back content"

module.exports = @Tile

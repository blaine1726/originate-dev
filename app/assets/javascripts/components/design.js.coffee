React = require 'react'

@Design = React.createClass
  componentDidMount: ->
    setAnimation()

  getInitialState: ->
    menuActive: false

  setMenuActive: ->
    @setState menuActive: !@state.menuActive

  render: ->
    customCSS = ""
    customCSS2 = ""
    if @state.menuActive
      customCSS = 'header-links show-menu'
      customCSS2 = 'tile-container show-menu'
    else
      customCSS = 'header-links hide-menu'
      customCSS2 = 'tile-container'
    {div} = React.DOM
    div {},
      div className: 'home-container',
        div {}, React.createElement HeaderSmall, null
        div className: 'padded-container divider',
          React.createElement HeaderMenu,
            active: 'Design'
            header: @props.quote.quote
        div className: customCSS2,
          React.createElement Tile,
            name: 'Featured Product'
            customCSS: 'white first-element'
            content1: 'Billie App'
            content2: 'Secondary Content'
            tileType: 'tile-half'
            gif: @props.assets.billie
            # gif: '/Untitled-1Artboard 1.jpg'
          React.createElement Tile,
            name: 'Upcooming Event'
            customCSS: 'white'
            content1: 'Attack 2016'
            content2: 'Secondary Content'
            tileType: 'tile-half'
            gif: @props.assets.upcoming
          React.createElement Tile,
            name: 'Design and Branding'
            tileType: 'tile-two-thirds'
            customCSS: 'white'
            content1: 'Adidas'
            content2: ''
            iframe: @props.assets.vimeo
          React.createElement Tile,
            name: 'OLabs'
            tileType: 'tile-third'
            customCSS: 'white text-right'
            content1: 'Gif Bot'
            content2: 'Secondary Content'
            gif: @props.assets.hexwave
          React.createElement BannerTile, null
          div className: 'column-third',
            React.createElement Tile,
              name: 'Inteview'
              customCSS: ''
              tileType: 'tile-tall'
              content1: 'Neil Degrasse Tyson'
              content2: 'Secondary Content'
              gif: @props.assets.ndt
          div className: 'column-two-thirds',
            React.createElement Tile,
              name: 'Meet Rob'
              tileType: 'tile-full'
              customCSS: 'white text-right'
              content1: 'Lead Web Architect'
              content2: ''
              gif: @props.assets.programmer
            React.createElement Tile,
              name: 'Data'
              tileType: 'tile-half'
              customCSS: 'text-right'
              gif: @props.assets.humanWaves
            React.createElement Tile,
              name: 'Driven'
              tileType: 'tile-half'
              customCSS: 'white'
              gif: @props.assets.digitalWaves
          # React.createElement Footer, null

module.exports = @Design

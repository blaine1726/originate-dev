React = require 'react'

@Home = React.createClass
  render: ->
    {a, div, img, svg, g, path, video, source} = React.DOM
    div
      className: 'parallax'
      id: 'parallax-scroll'
      div className: 'parallax__group group1',
        div className: 'parallax__layer parallax__layer--base',
          div className: 'inner-home',
            div className: 'home-text',
              React.createElement Logo, null
        div className: 'parallax__layer parallax__layer--back color1',
          div
            className: 'inner-home parallax-bg'
            id: 'home-animation'
      div className: 'parallax__group group2',
        div className: 'parallax__layer parallax__layer--base',
          div className: 'inner-home',
            div className: 'text-shadow', ""
        div className: 'parallax__layer parallax__layer--back color2',
          div className: 'inner-home', ''
      div className: 'parallax__group group3',
        div className: 'parallax__layer parallax__layer--base',
          div className: 'inner-home-base',
            div className: 'home-base-inner',
              div className: 'text-shadow', "Originate Design"
            div className: 'home-base-inner right',
              img
                className: 'home-iphone'
                src: @props.assets.iphone
        div className: 'parallax__layer parallax__layer--back color3',
          div className: 'inner-home',
            img
              className: 'parallax-img'
              src: @props.assets.newyork
      div className: 'parallax__group group2',
        div className: 'parallax__layer parallax__layer--base',
          div className: 'inner-home',
            div className: 'text-shadow', ""
        div className: 'parallax__layer parallax__layer--back color2',
          div className: 'inner-home', ''
      div className: 'parallax__group group3',
        div className: 'parallax__layer parallax__layer--base',
          div className: 'inner-home-base',
            div className: 'home-base-inner',
              div className: 'text-shadow', "Originate Design"
            div className: 'home-base-inner right',
              img
                className: 'home-iphone'
                src: @props.assets.iphone
        div className: 'parallax__layer parallax__layer--back color3',
          div
            className: 'inner-home parallax-bg'
            id: 'bird-container'
      div className: 'parallax__group group2',
        div className: 'parallax__layer parallax__layer--base',
          div className: 'inner-home',
            div className: 'text-shadow', ""
        div className: 'parallax__layer parallax__layer--back color2',
          div className: 'inner-home', 'back'
      div className: 'parallax__group group3',
        div className: 'parallax__layer parallax__layer--back color1',
          div className: 'inner-home',
            div {}, "We design, build, operate, and invest in transformative software products"
          div className: 'home-explore',
            a
              className: 'explore-link clickable'
              href: '/design'
              div {}, 'Explore'

module.exports = @Home
            # img
            #   className: 'parallax-img'
            #   src: "<%= asset_path('newyork.jpeg') %>"
      # div className: 'parallax__group group3',
      #   div className: 'parallax__layer parallax__layer--base',
      #     div className: 'inner-home', "Base"
      #   div className: 'parallax__layer parallax__layer--back',
      #     div className: 'inner-home', "Back"
      #   # id: 'group1'
      #   div className: 'parallax__layer parallax__layer--base',
      #     div className: 'inner', 'Base'
      #     # div className: 'home-text',
      #     #   React.createElement Logo, null
      #   div
      #     className: 'parallax__layer parallax__layer--back'
      #     div className: 'inner', "Background"
      #     # id: 'home-animation'
      #     # div className: 'inner',
      #     #   div className: 'explore',
      #     #     img
      #     #       className: 'home-arrow clickable'
      #     #       src: "<%= asset_path('down.png') %>"
      # div className: 'parallax__group',
      #   # id: 'group2'
      #   div className: 'parallax__layer parallax__layer--base',
      #     div className: 'inner', "Base"
      #       # img
      #       #   className: 'home-iphone'
      #       #   src: "<%= asset_path('iphone.png') %>"
      #   div
      #     className: 'parallax__layer parallax__layer--back'
      #     div className: 'inner',
      #       "BACK"
      # div
      #   className: 'parallax__group'
      #   id: 'home2'
      #   div
      #     className: 'parallax__layer parallax__layer--back'
      #     img
      #       className: 'home-iphone'
      #       src: "<%= asset_path('iphone.png') %>"
      #   div
      #     className: 'parallax__layer parallax__layer--base'
      #     "We design the most revolutionary software"
      # div
      #   className: 'parallax__group'
      #   id: 'home3'
      #   'Page 3'







    #---------------- OLD HOME PAGE ------------------
      # div className: 'sub-header divider',
      #   span className: 'sub-header-text',
      #     "We use design and technology to solve the world's most ambitious problems"
      # div className: 'padded-container divider',
      #   React.createElement NavTile,
      #     name: 'Solutions'
      #     path: 'solutions'
      #   React.createElement NavTile,
      #     name: 'Technology'
      #     path: 'technology'
      #   React.createElement NavTile,
      #     name: 'Design'
      #     path: 'design'
      #   React.createElement NavTile,
      #     name: 'People'
      #     path: 'people'
      #   React.createElement NavTile,
      #     name: 'Resources'
      #     path: 'resources'
      #   React.createElement NavTile,
      #     name: 'Careers'
      #     path: 'careers'
      # div className: 'padded-container divider',
      #   React.createElement NavTile,
      #     name: 'GitHub'
      #     icon: '/images/git.png'
      #   React.createElement NavTile,
      #     name: 'Instagram'
      #     icon: '/images/insta.png'
      #   React.createElement NavTile,
      #     name: 'LinkedIn'
      #     icon: '/images/in.png'
      # div className: 'padded-container divider',
      #   div className: 'contact-us', 'Contact us'
      #   div className: 'home-o',
      #     img
      #       className: 'logo-o'
      #       src: '/images/T96-0rfi.jpeg'
      # div className: 'padded-container-small',
      #   img
      #     className: 'down-arrow'
      #     src: '/images/Icons8-Ios7-Arrows-Down-4 (1).ico'

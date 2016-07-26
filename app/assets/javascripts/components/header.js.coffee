React = require 'react'

@Header = React.createClass
  render: ->
    {div, img} = React.DOM
    div {},
      div className: 'banner',
        div className: 'social-icon clickable left',
          img
            className: 'icon-img'
            src: '/images/chat.png'
        div className: 'banner-title',
          "We use design, data, and technology to solve today's problems"
        div className: 'social-icon clickable',
          img
            className: 'icon-img'
            src: '/images/insta.png'
        div className: 'social-icon clickable',
          img
            className: 'icon-img'
            src: '/images/in.png'
        div className: 'social-icon clickable',
          img
            className: 'icon-img'
            src: '/images/git.png'
      div className: 'custom-header',
        div className: 'header',
          img
            className: 'top-logo'
            alt: 'Originate'
            src: '/images/Originate-Logo-Black.png'
      div className: 'nav-bar-slide',
        div className: 'nav-inner',
          div className: 'header-link', "About"
          div className: 'vertical-bar'
          div className: 'header-link', "Technology"
          div className: 'vertical-bar'
          div className: 'header-link', "Solutions"
          div className: 'vertical-bar'
          div className: 'header-link', "People"
          div className: 'vertical-bar'
          div className: 'header-link', "Resources"
          div className: 'vertical-bar'
          div className: 'header-link', "Careers"
          div className: 'vertical-bar'
          div className: 'header-link', "Contact"

module.exports = @Header
    #   <div>
    #     <div className="banner">
    #       <div className="social-icon clickable left">
    #         <img src="/images/chat.png" className="icon-img"></img>
    #       </div>
    #       <div className="banner-title">
    #         We use design, data, and technology to solve today's problems.
    #       </div>
    #       <div className="social-icon clickable">
    #         <img src="/images/insta.png" className="icon-img"></img>
    #       </div>
    #       <div className="social-icon clickable">
    #         <img src="/images/in.png" className="icon-img"></img>
    #       </div>
    #       <div className="social-icon clickable">
    #         <img src="/images/git.png" className="icon-img"></img>
    #       </div>
    #     </div>
    #     <div className="custom-header">
    #       <div className="header">
    #         <img className="top-logo" alt="Originate"
    #           src="/images/Originate-Logo-Black.png">
    #         </img>
    #         {/*<div className="header-sub-title">
    #           We design, build, operate, and invest in
    #           transformative software products
    #         </div>*/}
    #       </div>
    #     </div>
    #     <div className="nav-bar-slide">
    #       <div className="nav-inner">
    #         <div className="header-link">About</div>
    #         <div className="vertical-bar"></div>
    #         <div className="header-link">Technology</div>
    #         <div className="vertical-bar"></div>
    #         <div className="header-link">Solutions</div>
    #         <div className="vertical-bar"></div>
    #         <div className="header-link">People</div>
    #         <div className="vertical-bar"></div>
    #         <div className="header-link">Resources</div>
    #         <div className="vertical-bar"></div>
    #         <div className="header-link">Careers</div>
    #         <div className="vertical-bar"></div>
    #         <div className="header-link">Contact</div>
    #       </div>
    #     </div>
    #   </div>
    # )

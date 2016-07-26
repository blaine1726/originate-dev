React = require 'react'

@HeaderSmall = React.createClass
  render: ->
    {a, div, img} = React.DOM
    div {},
      div className: 'small-header divider',
        img
          className: 'logo-small'
          src: '/assets/Originate-Logo-External-Black.png'
        a
          className: 'contact-button right clickable'
          href: '/contact'
          'Contact'

module.exports = @HeaderSmall

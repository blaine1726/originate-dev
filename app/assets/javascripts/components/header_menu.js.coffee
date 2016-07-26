React = require 'react'

@HeaderMenu = React.createClass
  # mixins: [ReactMeteorData]

  getInitialState: ->
    active: ''
    pageTitle: 'Home'

  setActive: (item) ->
    @setState active: item
    @setState pageTitle: item

  #Testing the Meteor subscriptions
  # getMeteorData: ->
  #   pageTitle: Meteor.subscribe('pageTitle', @state.pageTitle).ready()

  getPageTitle: ->
    Meteor.call 'get', @state.pageTitle, (err, result) ->
      if (err)
        return err
      else
        return result
    "blah"

  render: ->
    {a, div} = React.DOM
    div {},
      div className: 'menu-container',
        div className: 'menu-inner',
          a
            className: "menu-option clickable #{'current' unless @props.active != 'Solutions'}"
            href: '/solutions'
            onClick: => @setActive 'Solutions'
            div className: 'menu-option-text', 'Solutions'
          a
            className: "menu-option clickable #{'current' unless @props.active != 'Technology'}"
            href: '/technology'
            onClick: => @setActive 'Technology'
            div className: 'menu-option-text', 'Technology'
          a
            className: "menu-option clickable #{'current' unless @props.active != 'Design'}"
            href: '/design'
            onClick: => @setActive 'Design'
            div className: 'menu-option-text', 'Design'
          a
            className: "menu-option clickable #{'current' unless @props.active != 'People'}"
            href: '/people'
            onClick: => @setActive 'People'
            div className: 'menu-option-text', 'People'
          a
            className: "menu-option clickable #{'current' unless @props.active != 'Resources'}"
            href: '/resources'
            onClick: => @setActive 'Resources'
            div className: 'menu-option-text', 'Resources'
          a
            className: "menu-option clickable #{'current' unless @props.active != 'Careers'}"
            href: '/careers'
            onClick: => @setActive 'Careers'
            div className: 'menu-option-text', 'Careers'
      div className: 'page-title animate long-animation visible', @props.header

module.exports = @HeaderMenu

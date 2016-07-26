React = require 'react'

@People = React.createClass
  getInitialState: ->
    search: ''

  setSearch: (name) -> @setState search: name

  render: ->
    {div, input} = React.DOM
    div {},
      div className: 'home-container',
        div {}, React.createElement HeaderSmall, null
        div className: 'padded-container divider',
          React.createElement HeaderMenu,
            active: 'People'
            header: @props.quote.quote
        div className: 'padded-container',
          div className: 'people-options',
            div className: 'people-tags',
              div className: 'tag-container',
                div className: 'people-tag', 'Leadership'
                div className: 'people-tag', 'Recruiting'
              div className: 'tag-container',
                div className: 'people-tag', 'Engineering'
                div className: 'people-tag', 'Operations'
              div className: 'tag-container',
                div className: 'people-tag', 'Design'
                div className: 'people-tag', 'Advisors'
              div className: 'tag-container',
                div className: 'people-tag', 'Marketing'
            div className: 'people-search',
              input
                className: 'people-search-text'
                placeholder: 'Search people'
                text: @state.search
                onChange: (e) => @setSearch e.target.value
        #In the future this will be mapping the name and checking to see if
        #the name includes anything from the search bar at the top
        # How to do the search:
        # if @props.name[...@state.search.length] is @state.search
        div className: 'padded-container-small divider',
          div className: 'content-title', 'Leadership'
          div className: 'first-person',
            React.createElement PeopleTile,
              name: 'Rob Meadows'
              title: 'Founder & CEO'
          [1.. 10].map ->
            React.createElement PeopleTile,
              name: 'Johnathan Smithers'
              title: 'Something to do with web?'
        div className: 'padded-container-small divider',
          div className: 'content-title', 'Recruiting'
          [1.. 3].map ->
            React.createElement PeopleTile,
              name: 'Johnathan Smithers'
              title: 'Something to do with web?'
        div className: 'padded-container-small divider',
          div className: 'content-title', 'Engineering'
          [1.. 26].map ->
            React.createElement PeopleTile,
              name: 'Johnathan Smithers'
              title: 'Something to do with web?'
        div className: 'padded-container-small divider',
          div className: 'content-title', 'Operations'
          [1.. 6].map ->
            React.createElement PeopleTile,
              name: 'Johnathan Smithers'
              title: 'Something to do with web?'
        div className: 'padded-container-small divider',
          div className: 'content-title', 'Design'
          [1.. 6].map ->
            React.createElement PeopleTile,
              name: 'Johnathan Smithers'
              title: 'Something to do with web?'
        div className: 'padded-container-small divider',
          div className: 'content-title', 'Advisors'
          [1.. 4].map ->
            React.createElement PeopleTile,
              name: 'Johnathan Smithers'
              title: 'Something to do with web?'
        div className: 'padded-container-small divider',
          div className: 'content-title', 'Marketing'
          [1.. 2].map ->
            React.createElement PeopleTile,
              name: 'Johnathan Smithers'
              title: 'Something to do with web?'

module.exports = @People

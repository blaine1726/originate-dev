React = require 'react'

@Dropdown = React.createClass
  getInitialState: ->
    selected: no
    searchText: ""

  toggleSelected: ->
    @setState selected: !@state.selected

  selectOption: (opt) ->
    @props.setOption opt
    @toggleSelected()

  render: ->
    {div, img, input} = React.DOM
    search = null
    if @state.selected
      search = 'invisible'
    else
      search = 'visible'
    options = null
    if @state.selected
      options = 'vis'
    else
      options = 'hidden'
    div className: 'dropdown-outer',
      div className: 'dropdown-left',
        div
          className: 'custom-dropdown-menu left clickable'
          onClick: => @toggleSelected()
          'By Category'
          img
            className: "menu-caret #{'selected' if @state.selected}"
            src: @props.downArrow
      div className: 'dropdown-right',
        @props.options.map (option, id) =>
          div
            className: "dropdown-item left clickable #{options}"
            key: id
            onClick: => @selectOption option
            option
        input
          className: "resources-input #{search}"
          placeholder: 'Search'
          text: @state.searchText
          onChange: (e) => @props.setSearch e.target.value

module.exports = @Dropdown

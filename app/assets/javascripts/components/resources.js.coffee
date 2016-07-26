React = require 'react'
DropdownSelected = React.createFactory(window.DropdownSelected)

@Resources = React.createClass
  getInitialState: ->
    resource: null
    categories: []
    currCategories: []
    search: ""

  up: (x) -> return x.toUpperCase()

  componentDidMount: ->
    setAnimation()

  componentWillMount: ->
    @props.resources.map (resource) =>
      for category in resource.category.split " "
        newArray = @state.categories
        newArray.push category unless category in newArray
        @setState categories: newArray

  setCatAndAnimate: (cats) ->
    @setState currCategories: cats
    setTimeout ( ->
      setAnimation()
    ), 50

  # Nothing to see here, just a bunch of cats
  setCurrCategories: (cat) ->
    cats = @state.currCategories
    cats.push cat unless cat in cats
    @setCatAndAnimate cats

  # Naive approximate matching algorithm
  hasSubstring: (sub, main) ->
    maxDistance = 2
    if main.length >= sub.length
      for i in [0..(main.length-sub.length+1)]
        nmm = 0
        for j in [0..sub.length]
          if main[i+j] != sub[j]
            nmm += 1
            if nmm > maxDistance
              break
        if nmm <= maxDistance
          return true
    return false

  setResource: (res) -> @setState resource: res

  setSearch: (val) -> @setState search: val.toLowerCase()

  removeCat: (cat) ->
    newCat = @state.currCategories
    newCat.splice(newCat.indexOf(cat), 1)
    @setCatAndAnimate newCat

  render: ->
    {div, svg, line, g, rect} = React.DOM
    div {},
      div className: 'home-container resources',
        if @state.resource?
          React.createElement ShowResource,
            resource: @state.resource
            setResource: @setResource
            assets: @props.assets
            setResource: @setResource
        React.createElement HeaderSmall, null
        div className: 'padded-container divider',
          React.createElement HeaderMenu,
            active: 'Resources'
            header: @props.quote.quote
        div className: 'padded-container',
          React.createElement Dropdown,
            downArrow: @props.assets.downArrow
            options: @state.categories.sort()
            setOption: @setCurrCategories
            setSearch: @setSearch
          div className: 'selected-categories-outer',
            for cat, id in @state.currCategories
              DropdownSelected
                deselect: @removeCat
                option: cat
                key: id
                id: id
        div
          className: 'content-title full-width padding-bottom'
          if @state.currCategories.length > 1
            @state.currCategories.reduce (x, y) => @up(x) + ", " + @up(y)
          else if @state.currCategories.length == 1
            @up(@state.currCategories[0])
          else
            'All'
        div className: 'tile-container text-left',
          @props.resources.map (resource, id) =>
            params =
              id: resource.id
              key: id
              res: resource
              setResource: @setResource
            @hasSubstring(@state.search, resource.title)
            if @hasSubstring(@state.search, resource.title.toLowerCase()) or
            @hasSubstring(@state.search, resource.description.toLowerCase())
              if @state.currCategories.length == 0
                React.createElement(ResourceTile, params)
              else
                display = true
                for cat, id in @state.currCategories
                  display = false unless cat in resource.category.split " "
                if display
                  React.createElement ResourceTile, params


module.exports = @Resources

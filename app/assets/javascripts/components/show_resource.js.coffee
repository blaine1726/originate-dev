React = require 'react'
ReactMarkdown = React.createFactory(require('react-markdown'))
markdown = require('markdown').markdown
marked = require 'marked'
highlight = require 'highlight.js'
setHighlight: (code) ->
  highlight.highlightAuto(code).value

marked.setOptions({
  renderer: new marked.Renderer(),
  gfm: true,
  tables: true,
  breaks: false,
  pedantic: false,
  sanitize: true,
  smartLists: true,
  smartypants: false
  highlight: @setHighlight
})

@ShowResource = React.createClass
  getInitialState: ->
    readme: null

  componentDidMount: ->
    md = markdown.toHTML @props.resource.readme
    @setState readme: marked @props.resource.readme

  render: ->
    {a, div, img} = React.DOM
    div className: 'show-outer',
      div className: 'show-background', ""
      div className: 'show-title',
        div className: 'show-title-main', @props.resource.title
        div className: 'show-title-sub', @props.resource.description
        a
          className: 'github-page'
          href: @props.resource.github
          'View Github'
      div className: 'back-btn',
        div
          className: 'clickable'
          onClick: => @props.setResource null
          img
            className: 'back-img'
            src: @props.assets.backButton
      div className: 'show-content',
        # div className: 'show-content-desc',
        #   img
        #     className: 'show-img'
        #     src: @props.resource.background
        #   div className: 'show-description',
        #     div className: 'long-desc', @props.resource.long_description
        div
          className: 'readme'
          dangerouslySetInnerHTML: {__html: @state.readme}
        # ReactMarkdown
        #   className: 'readme'
        #   source: @props.resource.readme

module.exports = @ShowResource


# React = require 'react'
# ReactMarkdown = React.createFactory(require('react-markdown'))
#
# @ShowResource = React.createClass
#   render: ->
#     {a, div, img} = React.DOM
#     div className: 'show-outer',
#       div className: 'show-title',
#         div className: 'show-title-main', @props.resource.title
#         div className: 'show-title-sub', @props.resource.description
#         a
#           className: 'github-page'
#           href: @props.resource.github
#           'View Github'
#       div className: 'back',
#         a
#           className: 'clickable'
#           href: '/resources'
#           img
#             className: 'back-img'
#             src: @props.assets.backButton
#       div className: 'show-content',
#         div className: 'show-content-desc',
#           img
#             className: 'show-img'
#             src: @props.resource.background
#           div className: 'show-description',
#             div className: 'long-desc', @props.resource.long_description
#         ReactMarkdown
#           className: 'readme'
#           source: @props.resource.readme
#
# module.exports = @ShowResource

React = require 'react'

@PeopleTile = React.createClass
  getInitialState: ->
    showProfile: no
    testUrl: 'https://slack.com/api/auth.test?token=xoxp-2461706761-7987896516-54698119254-ae3459ace0&pretty=1'

  toggleShowProfile: -> @setState showProfile: !@state.showProfile

  # Code is rough for now, but that's because it needs to be synchronous with
  # nested ajax calls. Will figure out a refactor later
  postSlackMessage: ->
    userId = ''
    $.ajax
      url: @state.testUrl
      type: 'GET',
      success: (data) ->
        $.ajax
          url: 'https://slack.com/api/im.open?token=xoxp-2461706761-7987896516-54698119254-ae3459ace0&user=' + data.user_id
          type: 'GET',
          success: (res) ->
            $.ajax
              url: 'https://slack.com/api/chat.postMessage?token=xoxp-2461706761-7987896516-54698119254-ae3459ace0&channel=' + res.channel.id + '&text=TEST'
              type: 'POST'
              success: (res2) ->
                console.log res2

  directMessage: (e) ->
    e.stopPropagation()
    e.preventDefault()
    @postSlackMessage()

  render: ->
    {div, img} = React.DOM
    div {},
      div className: 'people-tile',
        div
          className: "people-outer clickable #{'show' if @state.showProfile}",
          onClick: @toggleShowProfile
          div className: 'people-inner',
            div className: 'people-base',
              div className: 'people-pic-container',
                img
                  className: 'profile-pic'
                  src: '/assets/Blank-Profile.jpg'
              div className: 'people-description',
                div className: 'people-name', @props.name
                div className: 'people-title', @props.title
              div className: 'social-outer right',
                img
                  className: 'social-icon'
                  src: '/assets/Slack_Mark_Black_Web.png'
                  onClick: (e) => @directMessage(e)
            div className: 'people-extra', "\"When I'm not working on one business idea, I'm thinking about another. My thirst for entrepreneurship is as strong as my interest in software development.\""
        div className: 'placeholder', ''

module.exports = @PeopleTile

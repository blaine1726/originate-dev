React = require 'react'

@Resource = React.createClass
  componentDidMount: ->
    master = new TimelineMax()
    master.add @loadRing(), "scene1"

  loadRing: ->
    outerRing = document.getElementById 'ring'
    ring1 = document.getElementById 'line1'
    ring2 = document.getElementById 'line2'
    ring3 = document.getElementById 'line3'
    ring4 = document.getElementById 'line4'
    ring5 = document.getElementById 'line5'
    tl = new TimelineMax(repeat: -1)
    tl.add('start')
    tl.to(outerRing, 0, {
      scale: .5
    }, 'start')
    .fromTo(ring1, 3, {
      rotation: 0
    }, {
      rotation: 360,
      svgOrigin: "150 150",
      ease:Linear.easeInOut
    }, 'start')
    .fromTo(ring2, 3, {
      rotation: 0
    }, {
      rotation: -360,
      svgOrigin: "150, 150",
      ease:Linear.easeInOut
    }, 'start')
    .fromTo(ring3, 3, {
      rotation: 0
    }, {
      rotation: 360,
      svgOrigin: "150, 150",
      ease:Linear.easeInOut
    }, 'start')
    .fromTo(ring4, 3, {
      rotation: 0
    }, {
      rotation: 360,
      svgOrigin: "150 150",
      ease:Linear.easeInOut
    }, 'start')
    .fromTo(ring5, 3, {
      rotation: 0
    }, {
      rotation: -360,
      svgOrigin: "150 150",
      ease:Linear.easeInOut
    }, 'start')
    tl.timeScale(1.5)

  render: ->
    {div, h1, svg, g, path} = React.DOM
    div className: 'padded-container',
      h1 className: 'title', "Loading Icon"
      div className: 'wrapper',
        svg
          version: "1.1"
          id: "loading-circles"
          xmlns: "http://www.w3.org/2000/svg"
          xmlns:xlink: "http://www.w3.org/1999/xlink"
          x: "0px"
          y: "0px"
          viewBox: "0 0 300 300"
          style:
            enableBackground: "new 0 0 300 300"
          xml:space: "preserve"
          g
            id: 'ring'
        		path
              className: "st0"
              id: 'line1'
              d: "M149.9,275.2c-68.6,0-124.5-55.9-124.5-124.5S81.3,26.2,149.9,26.2c34.3,0,67.3,14.3,90.8,39.3
          				c0.8,0.8,0.7,2.1-0.1,2.8c-0.8,0.8-2.1,0.7-2.8-0.1c-22.7-24.2-54.7-38.1-87.8-38.1c-66.4,0-120.5,54.1-120.5,120.5
          				c0,66.4,54.1,120.5,120.5,120.5c7.5,0,14.5-0.6,21.3-1.9c1.1-0.2,2.1,0.5,2.3,1.6c0.2,1.1-0.5,2.1-1.6,2.3
          				C164.9,274.6,157.6,275.2,149.9,275.2z"
        		path
              className: "st1"
              id: 'line2'
              d: "M184.9,242.9c-0.8,0-1.5-0.5-1.8-1.2c-0.4-1,0-2.2,1.1-2.6c35.8-15.3,58.9-50.3,58.9-89.3
          				c0-44.5-30.1-83.2-73.2-94.1c-1.1-0.3-1.7-1.4-1.5-2.4c0.3-1.1,1.4-1.7,2.4-1.5c44.9,11.3,76.2,51.6,76.2,97.9
          				c0,40.5-24.1,77-61.3,92.9C185.4,242.8,185.2,242.9,184.9,242.9z"
        		path
              className: "st2"
              id: 'line3'
              d: "M122.4,229.6c-0.2,0-0.4,0-0.7-0.1c-33.5-11.9-56-43.8-56-79.5c0-46.5,37.8-84.3,84.3-84.3
          				c7.5,0,15.2,1,22.8,3.1c1.1,0.3,1.7,1.4,1.4,2.4s-1.4,1.7-2.4,1.4c-7.3-1.9-14.6-2.9-21.8-2.9c-44.3,0-80.3,36-80.3,80.3
          				c0,34,21.4,64.4,53.4,75.7c1,0.4,1.6,1.5,1.2,2.6C124,229.1,123.2,229.6,122.4,229.6z"
        		path
              className: "st3"
              id: 'line4'
              d: "M98.2,184.1c-0.7,0-1.3-0.3-1.7-0.9c-6.2-9.9-9.4-21.3-9.4-33.2c0-34.7,28.2-62.9,62.9-62.9
          			c4.7,0,9.5,0.6,14.4,1.6c1.1,0.2,1.8,1.3,1.5,2.4c-0.2,1.1-1.3,1.8-2.4,1.5c-4.6-1-9.2-1.6-13.6-1.6c-32.5,0-58.9,26.4-58.9,58.9
          			c0,11.1,3,21.8,8.8,31c0.6,0.9,0.3,2.2-0.6,2.8C98.9,184,98.6,184.1,98.2,184.1z"
        		path
              className: "st4"
              id: 'line5'
              d: "M155.2,196.3c-1,0-1.9-0.8-2-1.8c-0.1-1.1,0.7-2.1,1.8-2.2c21.4-2.4,37.6-20.6,37.6-42.3
          				c0-16.5-9.2-31.3-24-38.4c-1-0.5-1.4-1.7-0.9-2.7c0.5-1,1.7-1.4,2.7-0.9c16.2,7.8,26.2,23.9,26.2,42c0,23.7-17.7,43.6-41.2,46.3
          				C155.3,196.3,155.3,196.3,155.2,196.3z"


module.exports = @Resource

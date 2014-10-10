
React = require 'react'
$ = React.DOM

store = require '../store'

XAxis = require './x-axis'
YAxis = require './y-axis'
Point = require './point'

module.exports = React.createClass
  displayName: 'Table'

  getInitialState: ->
    dragging: {}

  addX: ->
    store.addX()

  addY: ->
    store.addY()

  setDragging: (data) ->
    @setState dragging: data

  removeAxis: ->
    if @state.dragging.type is 'x'
      store.rmX @state.dragging.id
    if @state.dragging.type is 'y'
      store.rmY @state.dragging.id
    @setState dragging: {}

  render: ->
    {xs, ys, points} = @props.data

    xOrder = xs.map (item) => item.id
    yOrder = ys.map (item) => item.id

    xElements = xs.map (item, index) =>
      XAxis
        data: item, key: item.id, index: index
        setDragging: @setDragging
        dragging: @state.dragging
    yElements = ys.map (item, index) =>
      YAxis
        data: item, key: item.id, index: index
        dragging: @state.dragging
        setDragging: @setDragging

    points = xOrder.map (x, px) =>
      yOrder.map (y, py) =>
        data = store.getPoint x, y
        Point data: data, key: "#{x}-#{y}", x: px, y: py

    $.div
      className: 'table'
      style:
        width: "#{(xOrder.length + 2) * 200}px"
        height: "#{(yOrder.length + 2) * 50}px"
      $.div className: 'cell handler',
        $.div className: 'circle'
      xElements
      yElements
      $.div
        className: 'add cell'
        onClick: @addX
        style:
          top: '0'
          left: "#{(xElements.length + 1) * 200}px"
        onDragEnter: @removeAxis
        if @state.dragging.id? then '×' else '+'
      $.div
        className: 'add cell'
        onClick: @addY
        style:
          left: '0'
          top: "#{(yElements.length + 1) * 50}px"
        onDragEnter: @removeAxis
        if @state.dragging.id? then '×' else '+'
      points

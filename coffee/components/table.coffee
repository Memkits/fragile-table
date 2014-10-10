
React = require 'react'
$ = React.DOM

module.exports = React.createClass
  displayName: 'Table'

  render: ->
    {xs, ys, points} = @props.data

    xOrder = xs.map (item) => item.id
    yOrder = ys.map (item) => item.id

    xElements = xs.map (item, index) =>
      style = top: '0', left: "#{index * 100}px"
      $.div className: 'x cell', key: item.id, style: style, item.text
    yElements = ys.map (item) =>
      style = left: '0', top: "#{index * 50}px"
      $.div className: 'y cell', key: item.id, style: style, item.text
    points = points.map (item) =>
      px = xOrder.indexOf item.x
      py = yOrder.indexOf item.y
      style = left: "#{px * 100}px", top: "#{py * 50}px"
      $.div className: 'point cell', key: "#{item.x}-#{item.y}", style: style, item.text

    $.div className: 'table',
      $.div className: 'cell handler',
        $.div className: 'circle'
      xElements
      yElements
      $.div
        className: 'add cell'
        style:
          top: '0'
          left: "#{(xElements.length + 1) * 100}px"
        '+'
      $.div
        className: 'add cell'
        style:
          left: '0'
          top: "#{(yElements.length + 1) * 50}px"
        '+'
      points
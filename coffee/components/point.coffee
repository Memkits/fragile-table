
React = require 'react'
$ = React.DOM

store = require '../store'

module.exports = React.createClass
  displayName: 'Point'

  update: (event) ->
    store.editPoint
      x: @props.data.x
      y: @props.data.y
      text: event.target.value

  render: ->
    $.input
      className: 'point cell'
      key: "#{@props.data.x}-#{@props.data.y}"
      style:
        left: "#{(@props.x + 1) * 100}px"
        top: "#{(@props.y + 1) * 50}px"
      value: @props.data.text
      onChange: @update
      placeholder: 'point'
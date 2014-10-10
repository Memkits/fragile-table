
React = require 'react'
$ = React.DOM

store = require '../store'

module.exports = React.createClass
  displayName: 'Point'

  update: (event) ->
    store.editPoint
      x: @props.data.x
      y: @props.data.y
      text: event.target.innerText

  render: ->
    $.div
      contentEditable: yes
      className: 'point cell'
      key: "#{@props.data.x}-#{@props.data.y}"
      style:
        left: "#{(@props.x + 1) * 200}px"
        top: "#{(@props.y + 1) * 50}px"
      onKeyUp: @update
      @props.data.text
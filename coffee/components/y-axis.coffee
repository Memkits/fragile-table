
React = require 'react'
$ = React.DOM

store = require '../store'

module.exports = React.createClass
  displayName: 'Y-Axis'

  update: (event) ->
    store.updateY
      id: @props.data.id
      text: event.target.value

  render: ->
    $.input
      className: 'y cell'
      style:
        left: '0'
        top: "#{(@props.index + 1) * 50}px"
      value: @props.data.text
      placeholder: 'y axis'
      onChange: @update
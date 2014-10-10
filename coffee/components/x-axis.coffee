
React = require 'react'
$ = React.DOM

store = require '../store'

module.exports = React.createClass
  displayName: 'X-Axis'

  update: (event) ->
    store.updateX
      id: @props.data.id
      text: event.target.value

  render: ->
    $.input
      className: 'x cell'
      style:
        top: '0'
        left: "#{(@props.index + 1) * 100}px"
      value: @props.data.text
      placeholder: 'x axis'
      onChange: @update
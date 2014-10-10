
React = require 'react'
$ = React.DOM

store = require '../store'

module.exports = React.createClass
  displayName: 'X-Axis'

  componentDidMount: ->
    root = @refs.root.getDOMNode()
    if root.innerText.length is 0
      root.focus()

  update: (event) ->
    store.updateX
      id: @props.data.id
      text: event.target.innerText

  onDragStart: ->
    @props.setDragging
      type: 'x'
      id: @props.data.id

  onDragEnd: ->
    @props.setDragging {}

  onDragEnter: ->
    if @props.dragging.type is 'x'
      if @props.dragging.id isnt @props.data.id
        store.mvX @props.dragging.id, @props.data.id

  render: ->
    $.div
      ref: 'root'
      contentEditable: yes
      draggable: yes
      className: 'x cell'
      style:
        top: '0'
        left: "#{(@props.index + 1) * 200}px"
      onKeyUp: @update
      onDragStart: @onDragStart
      onDragEnter: @onDragEnter
      onDragEnd: @onDragEnd
      @props.data.text
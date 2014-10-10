
React = require 'react'
$ = React.DOM

store = require '../store'

module.exports = React.createClass
  displayName: 'Y-Axis'

  componentDidMount: ->
    root = @refs.root.getDOMNode()
    if root.innerText.length is 0
      root.focus()

  update: (event) ->
    store.updateY
      id: @props.data.id
      text: event.target.innerText

  onDragStart: ->
    @props.setDragging
      type: 'y'
      id: @props.data.id

  onDragEnd: ->
    @props.setDragging {}

  onDragEnter: ->
    if @props.dragging.type is 'y'
      if @props.dragging.id isnt @props.data.id
        store.mvY @props.dragging.id, @props.data.id

  render: ->
    $.div
      ref: 'root'
      contentEditable: yes
      draggable: yes
      className: 'y cell'
      style:
        left: '0'
        top: "#{(@props.index + 1) * 50}px"
      onKeyUp: @update
      onDragStart: @onDragStart
      onDragEnter: @onDragEnter
      onDragEnd: @onDragEnd
      @props.data.text

React = require 'react'
$ = React.DOM

module.exports = React.createClass
  displayName: 'Table'

  render: ->
    $.div {}, 'the table'

React = require 'react'
$ = React.DOM

Table = require './table'

module.exports = React.createClass
  displayName: 'app-component'

  render: ->
    @transferPropsTo Table()
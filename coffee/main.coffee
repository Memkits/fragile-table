
React = require 'react'

store = require './store'
App = require './components/app'

store.emit = ->
  app = App data: store.get()
  React.renderComponent app, document.body

store.emit()
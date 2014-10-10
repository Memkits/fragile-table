
React = require 'react'

store = require './store'

Table = require './components/table'

store.emit = ->
  app = Table data: store.get(), 'Insert Point'
  React.renderComponent app, document.body

store.emit()
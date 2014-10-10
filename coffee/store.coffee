
rawData = localStorage.getItem('fragile-table')
if rawData?
  storage = JSON.parse rawData
else
  storage =
    xs: []
    ys: []
    points: []

window.onbeforeunload = ->
  rawData = JSON.stringify storage
  localStorage.setItem 'fragile-table', rawData

tid = ->
  (new Date).valueOf()

module.exports =
  emit: ->
    console.log 'define you emit'

  get: ->
    storage

  addX: ->
    storage.xs.push
      id: tid()
      text: ''
    @emit()

  addY: ->
    storage.ys.push
      id:  tid()
      text: ''
    @emit()

  updateX: (data) ->
    for item in storage.xs
      if item.id is data.id
        item.text = data.text
        @emit()
        break

  updateY: (data) ->
    for item in storage.ys
      if item.id is data.id
        item.text = data.text
        @emit()
        break

  getPoint: (x, y) ->
    items = storage.points.filter (item) =>
      (item.x is x) and (item.y is y)
    if items[0]?
      items[0]
    else
      {x, y, text: ''}

  editPoint: (data) ->
    items = storage.points.filter (item) =>
      (item.x is data.x) and (item.y is data.y)
    if items[0]?
      items[0].text = data.text
    else
      storage.points.push data
    @emit()

  rmX: (id) ->
    target = storage.xs
    for item, index in target
      if item.id is id
        target.splice index, 1
        @emit()
        break

  rmY: (id) ->
    target = storage.xs
    for item, index in target
      if item.id is id
        target.splice index, 1
        @emit()
        break

  mvX: (a, b) ->
    target = storage.xs
    for item, index in target
      if item.id is a then pa = index
      if item.id is b then pb = index
    [target[a], target[b]] = [target[b], target[a]]
    @emit()

  mvY: ->
    target = storage.ys
    for item, index in target
      if item.id is a then pa = index
      if item.id is b then pb = index
    [target[a], target[b]] = [target[b], target[a]]
    @emit()
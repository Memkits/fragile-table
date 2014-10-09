
rawData = localStorage.getItem('fragile-table') or '{}'
if rawData?
  storage = JSON.parse rawData
else
  storage =
    xs: []
    ys: []
    points: []

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

  addY: ->
    storage.ys.push
      id:  tid()
      text: ''

  updateX: (data) ->
    for item in storage.xs
      if item.id is data.id
        item.text = data
        break

  updateY: (data) ->
    for item in storage.ys
      if item.id is data.id
        item.text = data
        break

  editPoints: (data) ->
    items = storage.points.filter (item) =>
      (item.x is data.x) and (item.y is data.y)
    if items[0]?
      item[0].text = data.text
    else
      storage.points.push data

  rmX: (id) ->
    target = storage.xs
    for item, index in target
      if item.id is id
        target.splice index, 1
        break

  rmY: (id) ->
    target = storage.xs
    for item, index in target
      if item.id is id
        target.splice index, 1
        break

  mvX: (a, b) ->
    target = storage.xs
    pa = 0
    pb = 0
    for item, index in target
      if item.id is a then pa = index
      if item.id is b then pb = index
    tmp = target[pa]
    target[pa] = target[pb]
    target[pb] = tmp

  mvY: ->
    target = storage.ys
    pa = 0
    pb = 0
    for item, index in target
      if item.id is a then pa = index
      if item.id is b then pb = index
    tmp = target[pa]
    target[pa] = target[pb]
    target[pb] = tmp
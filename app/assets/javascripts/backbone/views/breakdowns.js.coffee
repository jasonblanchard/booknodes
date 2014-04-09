class Booknodes.Views.Breakown extends Backbone.View
  className: 'breakdown'

  template: JST['backbone/templates/breakdown']

  render: ->
    @.$el.html(@.template({model: @.model}))
    return @


class Booknodes.Views.Breakdowns extends Backbone.View

  initialize: ->
    @.collection.on('add', @.addOne, @)
    @.collection.on('reset', @.addAll, @)

  render: ->
    @.addAll()
    return @

  addAll: ->
    @.$el.empty()
    @.collection.forEach(@.addOne, @)

  
  addOne: (model) ->
    breakdownView = new Booknodes.Views.Breakown({model: model})
    @.$el.append(breakdownView.render().el)

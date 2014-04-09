class Booknodes.Views.Breakown extends Backbone.View
  className: 'breakdown col-md-4'

  template: JST['backbone/templates/breakdown']

  render: ->
    @.$el.html(@.template({model: @.model}))
    return @


class Booknodes.Views.Breakdowns extends Backbone.View

  template: JST['backbone/templates/breakdowns']

  initialize: ->
    @.collection.on('add', @.addOne, @)
    @.collection.on('reset', @.addAll, @)
    @.items = []

  render: ->
    @.addAll()
    return @

  addAll: ->
    @.$el.empty()
    @.collection.forEach(@.addOne, @)
    #console.log(@.items)
    #@.$el.html(@.template({items: @.items}))

  
  addOne: (model) ->
    console.log(model)
    breakdownView = new Booknodes.Views.Breakown({model: model})
    @.$el.append(breakdownView.render().el)
    #@.items.push(breakdownView.render().$el)

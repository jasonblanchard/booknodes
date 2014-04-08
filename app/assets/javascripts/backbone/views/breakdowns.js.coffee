class Booknodes.Views.Breakdowns extends Backbone.View

  render: ->
    @.addAll
    return @

  addAll: ->
    @.$el.empty()
    @.collection.forEach(@.addOne, @)

  
  addOne: ->
    @.$el.append('cats')

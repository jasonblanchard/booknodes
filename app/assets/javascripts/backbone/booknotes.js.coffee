#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Booknodes =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

  initialize: (eventId) ->
    @breakdowns = new Booknodes.Collections.BreakdownsCollection([],{eventId: eventId})
    @breakdowns.fetch()
    @breakdownsView = new Booknodes.Views.Breakdowns({collection: @breakdowns})
    @breakdownsView.render()
    $('#app').append(@breakdownsView.el)

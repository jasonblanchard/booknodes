class Booknodes.Models.Breakdown extends Backbone.Model
  urlRoot: '/book_events/' + @.eventId


class Booknodes.Collections.BreakdownsCollection extends Backbone.Collection
  model: Booknodes.Models.Breakdown

  initialize: (models, options) ->
    @.url = '/book_events/' + options.eventId + '/breakdowns'

  parse: (response) ->
    return response.breakdowns

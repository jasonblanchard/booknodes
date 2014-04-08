class Booknodes.Models.Breakdown extends Backbone.Model
  urlRoot: '/book_events/' + @.eventId


class Booknodes.Collections.BreakdownsCollection extends Backbone.Model
  model: Booknodes.Models.Breakdown

  setupUrl: ->
    @.url = '/book_events/' + this.attributes.eventId + '/breakdowns'

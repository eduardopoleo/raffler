window.Raffler =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
     #We have to initialize the router
     new Raffler.Routers.Entries()
     Backbone.history.start() #starts the router or something like this.


$(document).ready ->
  Raffler.initialize()

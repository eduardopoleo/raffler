window.Raffler =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
     #We have to instantiate the class for the router to work
     new Raffler.Routers.Entries()
     Backbone.history.start() #starts the router or something like this. 


$(document).ready ->
  Raffler.initialize()

class Raffler.Routers.Entries extends Backbone.Router

  #Frontend routes
  routes:
    '': 'index'
    'entries/:id': 'show'

  initialize: ->
    #@something = this.something
    @collection = new Raffler.Collections.Entries()

  index: ->
    view = new Raffler.Views.EntriesIndex(collection: @collection)
    $('#container').html(view.render().el)
    #puts the el element with the template inside into the container

  #it will basically take the dynamic element of the url and pass in here.
  show: (id) ->
    alert "Entry #{id}"

class Raffler.Routers.Entries extends Backbone.Router
  #This matches app url to js function. So everytime you go to that url that
  #specific function runs

  #This is just an object in stupid coffescript
  routes:
    '': 'index'
    'entries/:id': 'show'

  initialize: ->
    #this is instantiating a new raffler collection and sets it as this.collection
    @collection = new Raffler.Collections.Entries()

  #this is just a regular js function!
  index: ->
    #we need to instantiate the view somewhere and we do it in here
    #we have to say that we are passing the collection into it
    view = new Raffler.Views.EntriesIndex(collection: @collection)
    $('#container').html(view.render().el)#remember that render returns thei view itself
    #puts the el element with the template inside into the container

  #it will basically take the dynamic element of the url and pass in here.
  show: (id) ->
    alert "Entry #{id}"

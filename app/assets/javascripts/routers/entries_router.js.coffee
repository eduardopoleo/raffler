class Raffler.Routers.Entries extends Backbone.Router
  #This matches app url to js function. So everytime you go to that url that
  #specific function runs

  #This is just an object in stupid coffescript
  routes:
    '': 'index'
    'entries/:id': 'show'

  #this is just a regular js function!
  index: ->
    #we need to instantiate the view somewhere and we do it in here
    view = new Raffler.Views.EntriesIndex()
    $('#container').html(view.render().el)#remember that render returns thei view itself
    #puts the el element with the template inside into the container

  #it will basically take the dynamic element of the url and pass in here.
  show: (id) ->
    alert "Entry #{id}"

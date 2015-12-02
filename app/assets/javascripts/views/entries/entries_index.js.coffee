class Raffler.Views.EntriesIndex extends Backbone.View
  #what is JST
  template: JST['entries/index'] #we can set any path for a template in here but

  #these are DOM events! They are defined at the top
  events:
    'submit #new_entry': 'createEntry'

  initialize: ->
    #This is insane! So the view might render the the template before the response
    #has come back from the server so we need to listen and wait until the
    # We register an event any time the @collection changes.
    @listenTo @collection, "reset add change remove", @render, this
    #These are events that mark the changes over data

    #After we have registered the callbacks we fetch the records
    @collection.fetch()
  #Backbone view must have a render method just like react comps
  render: ->
    #el empty div in this case
    $(@el).html(@template(entries: @collection)) #pass locals like in rails
    @collection.each(@appendEntry)
    this #so That we can chain methods

  appendEntry: ->
    view = new Raffler.Views.Entry()

  createEntry: (e) ->
    e.preventDefault()
    @collection.create name: $("#new_entry_name").val() #this actually persist into the database


#The problem with this is that every time that the collection changes we have
#to re render all the templates again.
#So we need to create another view-template pair that we would update locally
#to improve performance.

#In this case modularing the backbone application goes beyond of just being
#organized code it is actually necesarry for optimization.

class Raffler.Views.EntriesIndex extends Backbone.View
  #what is JST
  template: JST['entries/index'] #we can set any path for a template in here but

  events:
    'submit #new_entry': 'createEntry'

  initialize: ->
    #This is insane! So the view might render the the template before the response
    #has come back from the server so we need to listen and wait until the
    # collection has been filled up
    @listenTo @collection, "reset add change remove", @render, this
    #Change works when we render the first time
    #Add when we add a new record

    #After we have registered the callback after the event we can fetch all challenges
    @collection.fetch()
  #Backbone view must have a render method just like react comps
  render: ->
    $(@el).html(@template(entries: @collection)) #since el is not defined by default is going to be an empty div
    #basically renders the template inside the this.el element
    this #remember that this in here means the instance of the reffler view.

  createEntry: (e) ->
    e.preventDefault()
    @collection.create name: $("#new_entry_name").val() #this actually persist into the database

class Raffler.Views.EntriesIndex extends Backbone.View
  #what is JST
  template: JST['entries/index'] #we can set any path for a template in here but

  #these are DOM events! They are defined at the top
  events:
    'submit #new_entry': 'createEntry'

  initialize: ->
    #This are DATA changes events
    @listenTo @collection, "reset", @render, this
    @listenTo @collection, "add", @appendEntry, this

    #These are events that mark the changes over data

    #After we have registered the callbacks we fetch the records
    @collection.fetch()
  #Backbone view must have a render method just like react comps
  render: ->
    #el empty div in this case
    $(@el).html(@template(entries: @collection)) #pass locals like in rails
    @collection.each(@appendEntry)
    this #so That we can chain methods

  appendEntry: (entry) ->
    view = new Raffler.Views.Entry(model: entry)
    $('#entries').append(view.render().el)

  createEntry: (e) ->
    e.preventDefault()
    attributes = name: $("#new_entry_name").val()
    @collection.create attributes, #this actually persist into the database
      wait: true
      success: -> $('#new_entry')[0].reset()
      error: @handleError

  handleError: (entry, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute}, #{message}" for message in messages


#The problem with this is that every time that the collection changes we have
#to re render all the templates again.
#So we need to create another view-template pair that we would update locally
#to improve performance.

#In this case modularing the backbone application goes beyond of just being
#organized code it is actually necesarry for optimization.

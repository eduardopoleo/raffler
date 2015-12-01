class Raffler.Views.EntriesIndex extends Backbone.View
  #what is JST
  template: JST['entries/index'] #we can set any path for a template in here but

  initialize: ->
    #This is insane! So the view might render the the template before the response
    #has come back from the server so we need to listen and wait until the
    # collection has been filled up
    @listenTo @collection, "reset add change remove", @render, this

    #we fetch all the records from the server
    @collection.fetch()
  #Backbone view must have a render method just like react comps
  render: ->
    $(@el).html(@template(entries: @collection)) #since el is not defined by default is going to be an empty div
    #basically renders the template inside the this.el element
    this #remember that this in here means the instance of the reffler view.

class Raffler.Views.EntriesIndex extends Backbone.View
  #what is JST
  template: JST['entries/index'] #we can set any path for a template in here but
  
  #Backbone view must have a render method just like react comps
  render: ->
    $(@el).html(@template()) #since el is not defined by default is going to be an empty div
    #basically renders the template inside the this.el element
    this #remember that this in here means the instance of the reffler view.

class Raffler.Views.EntriesIndex extends Backbone.View

  template: JST['entries/index']

  #Backbone view must have a render method just like react comps
  render: ->
    $(@el).html(@template())
    #basically renders the template inside the this.el element
    this #remember that this in here means the instance of the reffler view.

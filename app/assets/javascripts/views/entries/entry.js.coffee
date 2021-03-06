class Raffler.Views.Entry extends Backbone.View
  template: JST['entries/entry']
  tagName: 'li'

  initialize: ->
    @listenTo @model, "change", @render, this
    @listenTo @model, "highlight", @highlightWinner, this
    #how do I know that this view will listen to this event?
    #it does not matter, it is not like it has to subscribe
    #the event just happens on the model and this will know

  highlightWinner: ->
    $('.winner').removeClass('hightlight')
    @$('.winner').addClass('hightlight') #@I think targets the current element

  render: ->
    $(@el).html(@template(entry: @model))
    this

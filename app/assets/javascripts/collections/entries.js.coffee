class Raffler.Collections.Entries extends Backbone.Collection
  url: 'api/entries'
  model: Raffler.Models.Entry #So that it knows which model are we refering to.

  # this generates the following urls for interacting with the url (very similar to rails resources)
  # GET  /books/ .... collection.fetch();
  # POST /books/ .... collection.create(); #just a regular create route
  # GET  /books/1 ... model.fetch();
  # PUT  /books/1 ... model.save();
  # DEL  /books/1 ... model.destroy();
  # we will obviously need to have this routes in our rails api for it to work

  #Interacts with the api layer and needs to know where is going to fetch the data from.

  #Backbone handles ajax calls directly with
  #collection.fetch()
  #model.get('property')
  #model.set({property: 'value'})
  #model.save will actually

  drawWinner: ->
    winner = @shuffle()[0]
    winner.win() if winner

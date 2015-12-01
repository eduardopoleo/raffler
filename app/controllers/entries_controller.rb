class EntriesController < ApplicationController
  respond_to :json #this is deprecated do I have to do respond_to blocks for every action.

  def index
    respond_with Entry.all
  end

  def show
    respond_with Entry.find(params[:id])
  end

  def create
    respond_with Entry.create(entries_params)
  end

  def update
    respond_with Entry.update(params[:id], entries_params)
  end

  def destroy
    respond_with Entry.destroy(params[:id])
  end

  private

  def entries_params
    params.require(:entry).permit!
  end
end

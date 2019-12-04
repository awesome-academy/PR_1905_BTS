class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find_by id: params[:id]
  end
end

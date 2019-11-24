class RatingsController < ApplicationController
  before_action :load_tour
  def create
    @rated = Rating.user_rated(current_user.id, params[:tour_id])
    if @rated.blank?
      @rate = current_user.ratings.build rating_params
      @rate.tour_id = params[:tour_id]
      @rate.save
      flash[:success] = "rating success"
    else
      @rated.update star: rating_params[:star]
    end
    redirect_to @tour
  end

  private
  def rating_params
    params.require(:rating).permit(:star)
  end

  def load_tour
    @tour = Tour.find_by id: params[:id]
     if @tour.nil?
    flash.now[:danger] = "tour not found"
    redirect_to tours_path
    end
  end
end

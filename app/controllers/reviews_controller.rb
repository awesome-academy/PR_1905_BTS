class ReviewsController < ApplicationController
  before_action :load_tour, only: :create
  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build review_params
    @review.tour_id = params[:tour_id]
    if @review.save
      flash[:success] = "reviews created"
      redirect_to @tour
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def load_tour
    @tour = Tour.find_by id: params[:tour_id]
      if @tour.nil?
    flash[:danger] = "tour not found"
    redirect_to root_path
  end
end

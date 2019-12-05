class ReviewsController < ApplicationController
  before_action :load_tour, only: [ :create, :new ]
  before_action :logged_in_user, only: :create

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
      flash.now[:danger] = "cant create review"
      render 'new'
    end
  end

  def update
    if @review.update review_params
      flash[:success] = "Success Update"
      redirect_to @review
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find_by id: params[:id]
    @review.destroy
    redirect_to tour_path(@review.tour)
  end

  private

  def review_params
    params.require(:review).permit(:content, :title)
  end

  def load_tour
    @tour = Tour.find_by id: params[:tour_id]
      if @tour.nil?
        flash[:danger] = "tour not found"
        redirect_to root_path
      end
  end
end

class LikesController < ApplicationController
  before_action :logged_in_user
  before_action :load_review

  def new
    @like = Like.new
  end

  def create
    unless current_user.liked? @review.id
      @like = current_user.likes.new
      @like.review = @review
      @result = @like.save
    end
  end

  def destroy
    @like = Like.find_by id: params[:id]
    @like.destroy
  end

  private
  def load_review
    @review = Review.find_by id: params[:review_id]
    if @review.nil?
      flash[:danger] = "review not found"
      redirect_to reviews_path
    end
  end
end

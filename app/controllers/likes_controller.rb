class LikesController < ApplicationController
  before_action :load_review
  def create
    unless current_user.liked? @review.id
      @like = current_user.likes.build
      @like.review = @review
    if @like.save
      redirect_to reviews_path
    else
      redirect_to reviews_path
    end
  end

  def destroy
    @like = Like.find_by id: params[:id]
    @like.destroy
    redirect_to reviews_path
  end

  private
  def load_review
    @review = Review.find_by id: params[:review_id]
    @review.nil?
    flash[:danger] = "review not found"
    redirect_to reviews_path
  end
end

class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :destroy]
  before_action :load_review

  def create
    @comment = @review.comments.new comment_params
    @comment.user = current_user
    @comment.review_id = @review.id
    if @comment.save
      flash[:success] = "comment success"
      redirect_to tour_path(@review.tour)
    else
      flash[:danger] = "cant create comment"
      redirect_to tour_path(@review.tour)
    end
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    @comment.destroy
    redirect_to tour_path(@review.tour)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def load_review
    @review = Review.find_by id: params[:review_id]
    if @review.nil?
      flash[:danger] = "review not found"
      redirect_to reviews_path
    end
  end
end

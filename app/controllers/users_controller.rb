class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  def index
    @users = User.all
  end

  def show
    @product = Product.find(params[:id])
    # @comment = current_user.comment.build(comment_params)
    @comments = @product.comments.order("created_at DESC")
    @comments = Comment.paginate(:page => params[:page], :per_page => 3).order("created_at DESC")
    @reviews = @user.reviews.paginate(page: params[:page])
    if @user.nil?
      flash[:danger] = "User not found!"
      redirect_to root_path
    end
  end

	def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "HK Travel"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :age, :phone, :admin)
  end
end

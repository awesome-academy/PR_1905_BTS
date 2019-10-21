class UsersController < ApplicationController
  
  def show

    if @user = User.find(params[:id])
        render 'show'
    else @user.valid?

        flash[:dagger] = "sdas"
    end

  end

	def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :age, :phone)
    end
end

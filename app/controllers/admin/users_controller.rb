class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update admin: user_params[:admin]
    if @user.admin?
      flash[:success] = "#{@user.name} is admin! "
    else
      flash[:success] = "#{@user.name} is normal user! "
    end
    redirect_to admin_users_path
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "deleted"
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit(:admin)
  end
end

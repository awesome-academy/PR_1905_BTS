class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def create_admin
    @user = User.find(params[:user_id])
    @user.admin = true
    @user.save
    flash[:success] = "#{@user.name} is Admin"
    redirect_to admin_users_path
  end

  def set_to_normal_user
    @user = User.find(params[:user_id])
    @user.admin = false
    @user.save
    flash[:success] = "#{@user.name} is normal user"
    redirect_to admin_users_path
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "deleted"
    redirect_to admin_users_path
  end
end

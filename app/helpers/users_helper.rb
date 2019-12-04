module UsersHelper

  private

 # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def check_admin
    redirect_to(root_url) unless current_user.admin?
    if !current_user.admin?
      flash[:danger] = "Your are not admin"
    end
  end
end

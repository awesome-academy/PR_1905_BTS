class Admin::BaseController < ApplicationController
  before_action :check_admin
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :admin_user, only: :destroy

  private
  def check_admin
    unless current_user && current_user.admin?
      redirect_to root_path, flash[:danger] = "Your are not admin"
    end
  end
end

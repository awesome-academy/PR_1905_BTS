module StaticPagesHelper
  def home
    if logged_in?
      @review  = current_user.microposts.build
    end
  end
end

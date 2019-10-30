class Admin::ToursController < Admin::BaseController
  def search
    @tours = Tour.where("title LIKE ?", "%" + params[:q]+ "%")
  end
end

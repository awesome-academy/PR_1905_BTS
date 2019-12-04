class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper
  include LikesHelper
end

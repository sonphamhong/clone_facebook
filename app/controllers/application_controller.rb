class ApplicationController < ActionController::Base
  protect_from_forgery
  include PublicActivity::StoreController
  before_filter :get_all_user
  hide_action :current_user

  def get_all_user
    @users = User.all
  end
end

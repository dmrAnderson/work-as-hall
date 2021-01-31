class ApplicationController < ActionController::Base
  before_action :get_current_user

  def get_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end
end

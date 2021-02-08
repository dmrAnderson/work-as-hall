class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :current_user

  def current_user
    Current.user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in!
    unless Current.user
      redirect_to(:sign_in, alert: 'You must be signed in to do that')
    end
  end
end

class PagesController < ApplicationController
  def home
    @user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def about; end
end

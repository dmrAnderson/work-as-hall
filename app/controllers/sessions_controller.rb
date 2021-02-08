class SessionsController < ApplicationController
  before_action :require_user_logged_in!, only: :destroy

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      log_in(user)
      redirect_to(:root, notice: 'Logged in successfully')
    else
      flash[:alert] = 'Invalid email or password'
      render(:new)
    end
  end

  def destroy
    log_out
    redirect_to(:root, notice: 'Logged out')
  end
end

class PasswordResetsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    PasswordMailer.with(user: @user).reset.deliver_now if @user
    redirect_to :root, notice: 'If an account with that email was found, we have sent a link to reset you password'
  end

  def edit
    @user = User.find_signed(params[:token], porpose: 'password_reset')
    # binding.erb
    if @user
      redirect_to :sign_in, alert: 'Your token has expired, please try again'
    end
  end

  def update
    @user = User.find_signed(params[:token], porpose: 'password_reset')
    if @user.update(password_params)
      redirect_to :sign_in. notice: 'Your password was reset successfully, please sign in'
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end

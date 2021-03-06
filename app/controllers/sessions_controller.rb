class SessionsController < ApplicationController
  skip_before_action :login_required
  before_action :logout_required, only: [:new]

  def new; end

  def create
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password]) && user&.activated
      session[:user_id] = user.id
      redirect_to user_path(user), notice: 'ログインしました。'
    else
      flash.alert = 'メールアドレスかパスワードが正しくありません。またはメールアドレスが認証されていません。'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'ログアウトしました。'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end

class AccountActivationsController < ApplicationController
  skip_before_action :login_required
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(params[:id])
      user.update_attribute(:activated, true)
      user.update_attribute(:activated_at, Time.zone.now)
      session[:user_id] = user.id
      redirect_to user, notice: "アカウントを認証しました！"
    else
      flash[:danger] = "アカウントを認証できませんでした。"
      redirect_to login_path
    end
  end
end

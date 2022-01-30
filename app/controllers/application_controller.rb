class ApplicationController < ActionController::Base
  helper_method :current_user, :current_unit
  before_action :login_required

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_unit
    @current_unit ||= User.find(current_user.id).participations.map(&:solicitation_id)
  end

  def login_required
    redirect_to login_url unless current_user
  end

  def logout_required
    redirect_to user_path(current_user) if current_user
  end

  def geinin_required
    redirect_to user_path(current_user) unless current_user.role == "芸人"
  end

  def staff_required
    redirect_to user_path(current_user) unless current_user.role == "スタッフ"
  end

end

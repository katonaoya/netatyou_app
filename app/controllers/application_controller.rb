class ApplicationController < ActionController::Base
  helper_method :current_user, :current_unit
  before_action :login_required

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_unit
    current_unit = Relationship.where(participation_id: current_user)&.ids
    @current_unit ||= current_unit ? Unit.find(current_unit) : nil
  end

  def login_required
    redirect_to login_url unless current_user
  end

end

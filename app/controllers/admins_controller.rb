class AdminsController < ApplicationController
  def admin_menu; end

  def user_management
    @users = User.all
  end

  def unit_management
    @unit = Unit.all
  end

  def live_management
    @live = Live.all
  end
end

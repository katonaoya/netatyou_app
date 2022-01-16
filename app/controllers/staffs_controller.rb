class StaffsController < ApplicationController
  def new
    @users = User.where.not(id: Live.find(params[:id]).staffs.map(&:user_id))
    @staff = Staff.new
    @live = Live.find(params[:id])
  end

  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      redirect_to live_path(params[:id]), notice: "#{User.find(staff_params[:user_id]).name}がスタッフに登録されました。"
    else
      @users = User.where.not(id: Live.find(params[:id]).staffs.map(&:user_id))
      render :new
    end
  end

  def edit
    @staffs = Live.find(params[:id]).staffs
  end

  def update
    staff_require.each do |id, position_params|
      staff = Staff.find(id)
      staff.update(position_params)
    end
    redirect_to live_path(params[:id]), notice: "情報が更新されました。"
  end

  private

  def staff_params
    params.require(:staff).permit(:live_id, :user_id, :pisition)
  end

  def staff_require
    params.permit(staff: [:position])[:staff]
  end
end

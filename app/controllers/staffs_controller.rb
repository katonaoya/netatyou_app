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
    if staff_require
      staff_require.each do |id, position_params|
        staff = Staff.find(id)
        staff.update(position_params)
      end
      redirect_to live_path(params[:id]), notice: '情報が更新されました。'
    else
      redirect_to live_path(params[:id])
    end
  end

  def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy
    redirect_to live_path(params[:live_id])
  end

  private

  def staff_params
    params.permit(:live_id, :user_id, :pisition)
  end

  def staff_require
    params.permit(staff: [:position])[:staff]
  end
end

class LivesController < ApplicationController
  before_action :staff_required, only: [:new, :create, :edit, :update, :koban, :koban_update]

  def index
    @lives = Live.all
  end

  def new
    @live = Live.new
  end

  def create
    @live = Live.new(live_params)
    if @live.save
      redirect_to live_path(@live), notice: 'ライブを作成しました。'
    else
      render :new
    end
  end

  def edit
    @live = Live.find(params[:id])
  end

  def update
    @live = Live.find(params[:id])
    if @live.update(live_params)
      redirect_to live_path(@live), notice: "#{@live.title}が更新されました。"
    else
      render :edit
    end
  end

  def show
    @live = Live.find(params[:id])
    @units = Live.line_up(@live.id)
    @comedians = Live.find(params[:id]).comedians
    @staffs = Live.find(params[:id]).staffs
  end

  def koban
    @performer_units = Unit.performer(params[:id])
    @comedians = Live.find(params[:id]).comedians
  end

  def koban_update
    if kobans_require
      kobans_require.each do |id, turn_params|
        comedian = Comedian.find(id)
        comedian.update(turn_params)
      end
      redirect_to live_path(params[:id]), notice: "情報が更新されました。"
    else
      redirect_to live_path(params[:id])
    end
  end

  private

  def live_params
    params.require(:live).permit(:title, :theater, :date, :item, :image, :user_id)
  end

  def kobans_require
    params.permit(comedians: [:turn])[:comedians]
  end

end

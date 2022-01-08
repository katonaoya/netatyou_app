class LivesController < ApplicationController

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
  end

  def show
    @live = Live.find(params[:id])
  end

  private

  def live_params
    params.require(:live).permit(:title, :theater, :date, :item, :image, :user_id)
  end

end

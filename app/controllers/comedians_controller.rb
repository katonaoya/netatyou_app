class ComediansController < ApplicationController
  def index
  end

  def new
    @comedian = Comedian.new
    @units = Unit.all
  end

  def create
    @comedian = Comedian.new(comedian_params)
    if @comedian.save
      redirect_to live_path(params[:id])
    else
      # @units = Unit.all
      # render :new
      raise SyntaxError
    end
  end

  def show
  end

  def edit
    @live = Live.find(params[:id])
    @units = Unit.performer(params[:id])
  end

  def update
    @comedian = Comedian.find(params[:id])
    if @comedian.update(comedian_params)
      redirect_to live_path(@comedian.live_id), notice: "#{Live.find(@comedian.live_id).title}が更新されました。"
    else
      render :edit
    end
  end

  private

  def comedian_params
    params.require(:comedian).permit(:live_id, :unit_id, :neta_id, :turn)
  end

end

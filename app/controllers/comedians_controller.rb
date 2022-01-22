class ComediansController < ApplicationController

  def new
    @comedian = Comedian.new
    @units = Unit.where.not(id: Live.line_up(params[:id]).map(&:id))
    if Comedian.find_by(live_id: params[:id])
      @turn = Comedian.where(live_id: params[:id]).map(&:turn).max+1
    else
      @turn = 1
    end
  end

  def create
    @comedian = Comedian.new(comedian_params)
    if @comedian.save
      redirect_to live_path(params[:id])
    else
      raise
      @comedian = Comedian.new
      @units = Unit.all
      if Comedian.find_by(live_id: params[:id])
        @turn = Comedian.where(live_id: params[:id]).map(&:turn).max+1
      else
        @turn = 1
      end
      render :new
    end
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

  def destroy
    @comedian = Comedian.find(params[:id])
    @comedian.destroy
    redirect_to live_path(params[:live_id])
  end

  private

  def comedian_params
    params.require(:comedian).permit(:live_id, :unit_id, :neta_id, :turn)
  end

end

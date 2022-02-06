class ComediansController < ApplicationController
  def new
    @comedian = Comedian.new
    @units = Unit.where.not(id: Live.line_up(params[:id]).map(&:id))
    @turn = if Comedian.find_by(live_id: params[:id])
              Comedian.where(live_id: params[:id]).map(&:turn).max + 1
            else
              1
            end
  end

  def create
    @comedian = Comedian.new(comedian_params)
    if @comedian.save
      redirect_to live_path(params[:id])
    else
      @turn = if Comedian.find_by(live_id: params[:id])
                Comedian.where(live_id: params[:id]).map(&:turn).max + 1
              else
                1
              end
      @comedian = Comedian.new
      @units = Unit.all
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

  def change
    @netas = Neta.where(unit_id: params[:id])
    @live = Live.find(params[:live_id])
  end

  def choice
    comedian = Comedian.find_by(live_id: params[:live_id], unit_id: params[:id])
    comedian.update(neta_id: params[:neta_id])
    redirect_to unit_path(params[:id])
  end

  private

  def comedian_params
    params.permit(:live_id, :unit_id, :neta_id, :turn)
  end

  def change_params
    params.permit(:live_id, :neta_id)
  end
end

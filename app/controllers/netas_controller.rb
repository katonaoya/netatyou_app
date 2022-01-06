class NetasController < ApplicationController
  def new
    @neta = Neta.new
    @unit = Unit.find(params[:id])
  end

  def create
    @neta = Neta.new(neta_params)
    if @neta.save
      redirect_to unit_path(@neta.unit_id), notice: 'ネタを保存しました。'
    else
      render :new
    end
  end

  def show
    @neta = Neta.find(params[:id])
  end

  def index
  end

  def edit
    @neta = Neta.find(params[:id])
    @unit = Unit.find(params[:id])
  end

  def update
    @neta = Neta.find(params[:id])
    if @neta.update(neta_params)
      redirect_to neta_path(@neta), notice: "#{@neta.title}が更新されました。"
    else
      render :edit
    end
  end

  private

  def neta_params
    params.require(:neta).permit(:title, :dialogue, :item, :minute, :second, :unit_id)
  end

end

class NetasController < ApplicationController
  before_action :geinin_required
  before_action

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
    if current_units_neta?
      @neta
    else
      redirect_to user_path(current_user)
    end
  end

  def index
  end

  def edit
    @neta = Neta.find(params[:id])
    if current_units_neta?
      @unit = Unit.find(params[:id])
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @neta = Neta.find(params[:id])
    if @neta.update(neta_params)
      redirect_to neta_path(@neta), notice: "#{@neta.title}が更新されました。"
    else
      render :edit
    end
  end

  def change
    @netas = Neta.where(unit_id: params[:id])
    @live = Live.find(params[:live_id])
  end

  def choice
    comedian = Comedian.find_by(live_id: change_params[:live_id], unit_id: params[:id])
    comedian.update(neta_id: change_params[:neta_id])
    redirect_to unit_path(params[:id])
  end

  private

  def current_units_neta?
    current_user.admin? || current_user == Unit.find(neta.unit_id).solicitations.map(&:participation)
  end

  def neta_params
    params.require(:neta).permit(:title, :dialogue, :item, :minute, :second, :unit_id)
  end

  def change_params
    params.permit(:live_id, :neta_id)
  end

end

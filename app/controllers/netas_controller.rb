class NetasController < ApplicationController
  before_action :comedian_required
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
    if current_user.admin?
      @neta
    elsif Unit.find(@neta.unit_id).solicitations.map(&:participation).include?(current_user)
      @neta
    else
      redirect_to user_path(current_user)
    end
  end

  def index
  end

  def edit
    @neta = Neta.find(params[:id])
    if current_user.admin?
      @neta
    elsif Unit.find(@neta.unit_id).solicitations.map(&:participation).include?(current_user)
      @neta
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

  private

  def neta_params
    params.require(:neta).permit(:title, :dialogue, :item, :minute, :second, :unit_id)
  end


end

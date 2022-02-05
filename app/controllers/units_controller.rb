class UnitsController < ApplicationController
  before_action :admin_user? , only:[:index, :destroy]
  before_action :comedian_required , only:[:new, :edit]

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(unit_params)
    if @unit.save
      Relationship.create(solicitation_id: @unit.id, participation_id: current_user.id)
      redirect_to unit_path(@unit), notice: "#{@unit.name}が登録されました。"
    else
      render :new
    end
  end

  def edit
    @unit = Unit.find(params[:id])
  end

  def update
    @unit = Unit.find(params[:id])
    @unit.image.attach(params[:unit][:image])
    if @unit.update(unit_params)
      redirect_to unit_path(@unit), notice: "#{@unit.name}が登録されました。"
    else
      render :edit
    end
  end

  def index
    @units = Unit.all
  end

  def show
    @unit = Unit.find(params[:id])
  end

  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy
    redirect_to units_path
  end

  private

  def unit_params
    params.require(:unit).permit(:name, :kana, :belongs, :birthday, :image)
  end

end

class UnitsController < ApplicationController
  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(unit_params)
    if @unit.save
      @unit.join_unit(current_user)
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

  private

  def unit_params
    params.require(:unit).permit(:name, :kana, :belongs, :birthday, :image])
  end

end

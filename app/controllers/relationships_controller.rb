class RelationshipsController < ApplicationController
  def new
    @relationship = Relationship.new
    @unit = Unit.find(params[:id])
    @users = User.where.not(id: current_user.id, id: User.member(@unit.id).map(&:id))
  end

  def create
    @relationship = Relationship.new(relationship_params)
    if @relationship.save
      redirect_to unit_path(params[:id])
    else
      @users = User.where.not(id: current_user.id)
      render :new
    end

  end

  def destroy
    @relationship = Relationship.find_by(solicitation_id: params[:unit_id], participation_id: params[:id])
    @relationship.destroy
    redirect_to unit_path(params[:unit_id]), notice: "#{User.find(params[:id]).name}をメンバーから外しました。"
  end

  private

  def relationship_params
    params.require(:relationship).permit(:solicitation_id, :participation_id)
  end

end

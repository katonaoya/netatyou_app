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

  private

  def relationship_params
    params.require(:relationship).permit(:solicitation_id, :participation_id)
  end

end

class RelationshipsController < ApplicationController
  def new
    @relationship = Relationship.new
    @unit = Unit.find(params[:id])
    @users = User.where.not(id: current_user.id, id: User.member(@unit.id).map(&:id))
  end

  def create
    @relationship = Relationship.new(params.require(:relationship).permit(:solicitation_id, :participation_id))
    if @relationship.save
      redirect_to unit_path(params[:id])
    else
      @users = User.where.not(id: current_user.id)
      render :new
    end
    # @relationship.save
    # redirect_to unit_path(params[:id]), notice: "#{User.find(@relationship.participation_id).name}登録されました。"
    # else
    #   render :new
    # end
  end

  private

  def relationship_params
 
  end

end

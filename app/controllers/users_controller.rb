class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user), notice: "#{@user.name}が登録されました。"
    else
      render :new, notice: "失敗しました"
    end

  end

  def edit
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end

end

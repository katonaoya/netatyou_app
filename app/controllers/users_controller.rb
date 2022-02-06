class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create]
  before_action :logout_required, only: %i[new create]
  before_action :admin_user?, only: %i[index destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      redirect_to login_path, notice: "#{@user.email}に認証メールを送信しました。メールアドレスにあるリンクから、メールアドレスを認証してください。"
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "#{@user.name}の情報が更新されました。"
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role, :skill, :birthday, :profile, :main_unit_id)
  end
end

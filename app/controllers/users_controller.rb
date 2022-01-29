class UsersController < ApplicationController
  skip_before_action :login_required, only:[:new, :create]
  def new
    @user = User.new
  end

  def index
    @users = User.all
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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "#{@user.name}の情報が更新されました。"
    else
      render :edit
    end
  end


  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role, :skill, :birthday, :profile, :main_unit_id)
  end

end

class UsersController < ApplicationController
  skip_before_action :login_required

  def new
    @user = User.new
  end

  def edit
    @user = current_user.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to login_path, notice: "ユーザー登録が完了しました！"
    else
        render :new
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to user_url
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
end

  private
  def user_params
    params.require(:user).permit(:name, :cname, :email, :grade, :pta_officer, :pta_officer_history, :memo, :password, :password_confirmation)
 end
end

class UsersController < ApplicationController
  skip_before_action :login_required
  before_action :search, only: [:index, :search]

  def new
    @user = User.new
  end

  def search
    @user = User.find(params[:id])
      if @user = current_user
        render "edit"
      else
        redirect_to users_path
      end
  end

  def edit
    
    @user = User.find(params[:id])
      if @user = current_user
        render "edit"
      else
        redirect_to "/users/#{@user.id}/edit"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def search
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
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

    def set_q
      @q = User.ransack(params[:q])
    end
end

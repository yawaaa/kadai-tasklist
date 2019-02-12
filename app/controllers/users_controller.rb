class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  before_action :correct_user, only: [:show]
  
  
  
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザ登録完了"
      redirect_to @user
    else
      flash[:danger] = "ユーザ登録失敗"
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def correct_user
    # binding.pry
    @user = current_user.id.to_s == params[:id]
    unless @user
      flash[:danger] = "他のユーザ情報は閲覧/編集出来ません。"
      redirect_to root_url
    end
  end
  
end

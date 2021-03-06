class SessionsController < ApplicationController
  # binding.pry
  def new
  end
  
  def create
  # binding.pry

    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = "ログインに成功"
      redirect_to root_url
    else
      flash.now[:danger] = "ログインに失敗"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "ログアウトしました"
    redirect_to root_url
  end
  
  private
  
  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      # LOGIN SUCCESS
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
  
end

class UsersController < ApplicationController

  def new
    @user = User.new 
    #なぜかlocalhostではここないとエラー
    #本番環境ではあるとエラー、本番に合わせる
  end

  def create
    @user =User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
    session[:user_id] = @user.id
    flash[:notice] = "ユーザー登録が完了しました"
    redirect_to("/users/#{@user.id}")
    else 
    render("/users/new") 
    end
  end
  
  def show
    @user = User.find_by(id: params[:id])
    if @user
    session[:user_id] = @user.id
    flash[:notice] = "    #{@user.name}の My ストーリー部屋が作成されました"
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(name: params[:name], password: params[:password])
    if @user
      session[:user_id] = @user.id
      # flash[:notice] = "ログインしました"
      redirect_to("/posts/personal")
    else
      @error_message = "ユーザー名またはパスワードが違います"
      @name = params[:name]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
  
end

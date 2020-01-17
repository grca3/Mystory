class PostsController < ApplicationController
  before_action :current_user
  
  def personal
     @posts = Post.where(user_id: current_user).order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content],user_id: @current_user.id)
    if @post.save
    flash[:notice] = "投稿しました"
    redirect_to("/posts/personal")
    else
      render("posts/new")
    end

  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if params[:image]
      @post.img = "#{@post.id}.jpg"
      image = params[:image]
    File.binwrite("public/img/#{@post.img}",image.read)
    end
  
    if @post.save
    flash[:notice] = "投稿しました"
    redirect_to("/posts/personal")
    else
    render("posts/edit") 
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id]) 
    @post.destroy
    flash[:notice] = "削除しました"
    redirect_to("/posts/personal")
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

end

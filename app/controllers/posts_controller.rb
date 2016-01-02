class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Новая запись успешно опубликована."
      redirect_to @post
    else
      flash.now[:alert] = "Запись не была опубликована."
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    if @post.save
      flash[:notice] = "Запись была успешно изменена."
      redirect_to @post
    else
      flash.now[:alert] = "Запись не была изменена."
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.delete
      flash[:notice] = "Запись была успешно удалена."
      redirect_to posts_path
    end
  end


  private

  def post_params
    params.require(:post).permit(:header, :reading_time, :excerpt, :body)
  end
end

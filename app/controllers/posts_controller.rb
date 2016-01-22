class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    3.times {@post.images.build}
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
  end

  def edit
  end

  def update
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
    if @post.delete
      flash[:notice] = "Запись была успешно удалена."
      redirect_to posts_path
    end
  end


  private

  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Такой записи тут нет."
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:header, :reading_time, :excerpt, :body,
    images_attributes: [:file, :file_cache])
  end
end

class PostsController < ApplicationController
  def index
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


  private

  def post_params
    params.require(:post).permit(:header, :reading_time, :excerpt, :body)
  end
end

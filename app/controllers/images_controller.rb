class ImagesController < ApplicationController
  def new
    @index = params[:index].to_i
    @post = Post.new
    @post.images.build
    render layout: false
  end

  def show
    image = Image.find(params[:id])
    send_file image.file.path, disposition: :inline
  end
end

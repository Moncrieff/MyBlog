class ImagesController < ApplicationController
  def show
    image = Image.find(params[:id])
    send_file image.file.path, disposition: :inline
  end
end

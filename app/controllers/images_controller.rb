class ImagesController < ApplicationController
  before_action :load_image, except: [:index, :new, :create]

  def show

  end

  def new
    @image = Image.new
  end

  def create
    image = Image.new image_params
    image.user_id = current_user.id
    if image.save
      flash[:succsess] = t "succsess_create"
      redirect_to root_url
    else
      flash_error image
      redirect_to :back
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def image_params
    params.require(:image).permit :name, :url, :user_id, :album_id
  end

  def load_image
    @image = Image.find_by id: params[:id]
    unless @image
      flash[:danger] = t "not_found_album"
      redirect_to root_url
    end
  end
end

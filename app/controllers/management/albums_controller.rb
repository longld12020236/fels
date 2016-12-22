class Management::AlbumsController < ApplicationController
  before_action :user_signed_in
  before_action :load_album, except: [:index, :create, :new]
  before_action :manager_verify

  def index
    @club = Club.find_by id: params[:id]
    @albums = Album.album_club @club.id
    @albums.each do |album|
      @image = album.images.first
    end
    session[:club] = params[:id]
  end

  def show
    @images = @album.images
  end

  def new
    @album = Album.new
  end

  def create
    album = Album.new album_params
    album.club_id = session[:club]
    if album.save
      flash[:succsess] = t "succsess_create"
      redirect_to club_member_path(album.club_id)
    else
      flash_error album
      redirect_to :back
    end
  end

  def edit
  end

  def update
    if @album.update_attributes album_params
      flash[:success] = "Updated"
      redirect_to club_member_path(@album.club_id)
    else
      flash[:danger] = "Can not updated"
      render :edit
    end
  end

  def destroy
  end

  private
  def album_params
    params.require(:album).permit :club_id, :name
  end

  def load_album
    @album = Album.find_by id: params[:id]
    unless @album
      flash[:danger] = t "not_found_album"
      redirect_to club_member_path(album.club_id)
    end
  end
end

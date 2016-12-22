class AlbumsController < ApplicationController
  before_action :user_signed_in
  before_action :load_album, except: :index

  def index
    @club = Club.find_by id: params[:id]
    @albums = Album.album_club @club.id
  end

  def show
    @images = @album.images
  end

  private
  def load_album
    @album = Album.find_by id: params[:id]
    unless @album
      flash[:danger] = t "not_found_album"
      redirect_to club_member_path(album.club_id)
    end
  end
end

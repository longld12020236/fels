class Management::UserClubsController < ApplicationController
  before_action :user_signed_in
  before_action :load_user_club, only: [:edit, :update]
  before_action :manager_verify, only: [:edit, :update]

  def index
    @club = Club.find_by id: params[:id]
    @user_clubs = UserClub.unactive.user_club @club.id
  end

  def edit
  end

  def update
    @user_club.status = true
    if @user_club.update_attributes user_club_params
      flash[:success] = "Updated"
      redirect_to root_url
    else
      flash[:danger] = "Can not updated"
      render :edit
    end
  end

  private
  def load_user_club
    @user_club = UserClub.find_by id: params[:id]
    unless @user_club
      flash_error @user_club
      redirect_to root_path
    end
  end

  def user_club_params
    params.permit :status
  end
end

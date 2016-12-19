class UserClubsController < ApplicationController
  before_action :load_club_club_user, only: :create
  before_action :load_user_club, :load_club, only: :destroy
  def create
    user_club = UserClub.new user_club_params
    unless user_club.save
      flash_error user_club
      redirect_to :back
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    unless @user_club.destroy
      flash_error @user_club
      redirect_to :back
    end
    respond_to do |format|
      format.js
    end
  end

  private
  def load_user_club
    @user_club = UserClub.club_scope(current_user).find_by club_id: params[:id]
    unless @user_club
      flash_error @user_club
      redirect_to root_path
    end
  end

  def load_club_club_user
    @club = Club.find_by id: params[:user_club][:club_id]
    unless @club
      flash_error @club
      redirect_to :back
    end
  end

  def load_club
    @club = Club.find_by id: params[:id]
    unless @club
      flash_error @club
      redirect_to root_path
    end
  end

  def user_club_params
    params.require(:user_club).permit(:club_id).merge! user_id: current_user.id, status: false
  end
end

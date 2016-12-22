class ClubMemberController < ApplicationController
  include ClubMemberHelper

  before_action :load_club, only: [:show, :update]
  def index
  end

  def show
    @events = @club.events
  end

  def edit
    load_club
  end

  def update
    if @club.update_attributes club_member_params
      flash[:succsess] = t("success_update")
    else
      flash_error @club
    end
    redirect_to root_path
  end

  def club_member_params
    params[:name] = params[:club_member][:name]
    params[:description] = params[:club_member][:description]
    params[:notification] = params[:club_member][:notification]
    params.permit :name, :description, :notification
  end

end

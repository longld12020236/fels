class UserEventsController < ApplicationController
  before_action :load_event

  def create
    user_event = UserEvent.new user_event_params
    unless user_event.save
      flash_error user_event
      redirect_to :back
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    user_event = UserEvent.user_event(@event, current_user).find_by club_id: @event.club_id
    unless user_event.destroy
      flash_error user_event
      redirect_to :back
    end
    respond_to do |format|
      format.js
    end
  end

  private
  def user_event_params
    params[:event_id] = params[:id]
    params.permit(:event_id).merge! user_id: current_user.id,
      club_id: @event.club.id
  end

  def load_event
    @event = Event.find_by id: params[:id]
    unless @event
      flash_error @event
      redirect_to :back
    end
  end
end

class EventsController < ApplicationController
  before_action :load_event, only: :show

  def show
  end

  private
  def load_event
    @event = Event.find_by id: params[:id]
    unless @event
      flash_error @event
      redirect_to :back
    end
  end
end

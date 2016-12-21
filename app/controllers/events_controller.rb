class EventsController < ApplicationController
  before_action :load_event, only: :show

  def show
  end

  private
  def load_event
    @event = Event.find_by id: params[:id]
    unless @event
      flash[:danger] = t("not_found")
      redirect_to root_url
    end
  end
end

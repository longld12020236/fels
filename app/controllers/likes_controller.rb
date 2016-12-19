class LikesController < ApplicationController
  before_action :load_event, only: [:create, :destroy]

  def create
    unless @event.update_columns number_like: @event.number_like.to_i + 1
      flash_error @event
      redirect_to :back
    end
    create_acivity @event, "Like"
    respond_to do |format|
      format.js
    end
  end

  def destroy
    unless @event.update_columns number_like: @event.number_like.to_i - 1
      flash_error @event
      redirect_to :back
    end
    destroy_activity @event, "Like"
    respond_to do |format|
      format.js
    end
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

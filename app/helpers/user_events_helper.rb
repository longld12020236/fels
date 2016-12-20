module UserEventsHelper
  def join_event? event
    user_event = UserEvent.user_event(event, current_user).present?
  end
end

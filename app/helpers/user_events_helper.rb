module UserEventsHelper
  def join_event? event
    user_event = UserEvent.user_event(event, current_user).present?
  end

  def num_member_joins event
    UserEvent.member_joins(event).size
  end
end

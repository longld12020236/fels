class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :club
  scope :user_event, -> event, user {where event_id: event.id, user_id: user.id}
end

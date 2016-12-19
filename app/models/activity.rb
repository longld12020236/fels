class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :target, polymorphic: true

  def self.rate? club, user
    user.activities.where(target_id: club.id, action: "Rating", user_id: user.id).any?
  end

  def self.by_target target
    where target: target
  end

  def self.by_action action
    where action: action
  end
end

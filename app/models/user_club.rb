class UserClub < ApplicationRecord
  belongs_to :user
  belongs_to :club

  def self.user_club_scope user
    where user_id: user.id
  end
end

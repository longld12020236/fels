class UserClub < ApplicationRecord
  belongs_to :user
  belongs_to :club
  has_many :clubs, through: :user_clubs


  def self.user_club_scope user
    where user_id: user.id
  end

  def self.club_scope user
    where user_id: user.id
  end
end

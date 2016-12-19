class Club < ApplicationRecord
  has_many :user_clubs, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :user_events, dependent: :destroy
  has_many :requests, as: :target, dependent: :destroy
  belongs_to :organization

  def self.alias user_club
    Club.find(user_club.club_id).name
  end
end

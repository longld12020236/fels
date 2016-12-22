class Event < ApplicationRecord
  has_many :news, dependent: :destroy
  has_many :user_events, dependent: :destroy
  has_many :requests, as: :target, dependent: :destroy
  belongs_to :club
end

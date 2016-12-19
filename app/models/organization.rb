class Organization < ApplicationRecord
  has_many :clubs, dependent: :destroy
  has_many :users

  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true
  validates :phone, presence: true
  validates :location, presence: true
  validates :description, presence: true
end

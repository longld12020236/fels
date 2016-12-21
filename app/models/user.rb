class User < ApplicationRecord
  has_many :user_clubs, dependent: :destroy
  has_many :user_events, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :images
  has_many :comments, dependent: :destroy
  has_many :news, dependent: :destroy

  belongs_to :organization

  enum role: {admin: 1, manager: 2, member: 3}

  mount_uploader :avatar, AvatarUploader

  validates :full_name, presence: true, length: {maximum: Settings.max_name}
  validates :password, presence: true, length: {minimum: Settings.min_password}
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  def self.custom_user id_array
    self.where("id IN (?)",id_array)
  end
end

class ClubRequest < ApplicationRecord
  belongs_to :organization
  belongs_to :user

  scope :unapprove, ->{where approve: false}
end

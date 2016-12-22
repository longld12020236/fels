class UserClub < ApplicationRecord
  belongs_to :user
  belongs_to :club

  scope :user_club, ->club_id do
    where club_id: club_id
  end

  scope :unactive, ->{where status: false}

  def self.user_club_scope user
    where user_id: user.id
  end

  def self.club_scope user
    where user_id: user.id
  end

  def unjoin_club
    @user_club = self.club_scope user
    @unjoin_club = Club.activies_club.where("")
  end

  def self.club_to_array user
    arr = []
    if user.nil?
      user_club = UserClub.all
    else
      user_club = UserClub.where user_id: user.id
    end
    user_club.each_with_index do |uc, index|
      arr[index] = uc.club_id
    end
    arr
  end

end

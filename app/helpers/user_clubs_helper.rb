module UserClubsHelper
  def status_user_club club
    user_club = UserClub.club_scope(current_user).find_by(club_id: club.id)
    if user_club
      user_club.status
    else
      nil
    end
  end
end

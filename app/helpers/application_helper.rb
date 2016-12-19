module ApplicationHelper
  def devise_error_messages!
    resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def index_continue object, index, per_page
    (object.to_i - 1) * per_page.to_i + index + 1
  end

  def flash_error object
    flash[:danger] = object.errors.full_messages
  end
  def is_management? club
    club = UserClub.club_scope(current_user).find_by(club_id: club.id)
    club.is_manager if club
  end
end

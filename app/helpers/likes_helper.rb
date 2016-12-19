module LikesHelper
  def likes_toggle event
    activity = Activity.by_target(event).by_action("Like").find_by user_id: current_user.id
    if activity.present?
      link_to " DisLike (#{@event.number_like})", like_path(id: @event.id),
        method: :delete, class: "fa fa-thumbs-o-down", remote: true
    else
      link_to " Like (#{@event.number_like})", likes_path(id: @event.id),
        method: :post, class: "fa fa-thumbs-o-up", remote: true
    end
  end
end

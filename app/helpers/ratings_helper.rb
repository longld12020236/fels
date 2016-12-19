module RatingsHelper
  def count_rating club
    count_rating = Activity.where(action:"Rating", target_id: club.id).size
  end
end

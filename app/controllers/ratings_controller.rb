class RatingsController < ApplicationController
  include RatingsHelper
  def create
    @club = Club.find_by id: params[:club_id]
    unless Activity.rate? @club, current_user
      new_rating = rate count_rating @club
      @club.update_columns rating: new_rating
      create_acivity @club, "Rating"
    end
    respond_to do |format|
      format.js
    end
  end

  def rate old_rate_count
    (@club.rating.to_f * old_rate_count + params[:rating].to_i)/(old_rate_count + 1)
  end


end

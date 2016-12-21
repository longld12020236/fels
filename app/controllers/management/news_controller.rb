class Management::NewsController < ApplicationController

  def new
    user_club = UserClub.user_club_scope current_user
    array_id = attribute_object_array user_club, :club_id
    @clubs = Club.where("id IN (?)", array_id)
    @clubs_option = @clubs.map {
      |club| [club.name,
        club.events.map {
          |event| [event.name,event.id]
        }
      ]
    }
    # @clubs = Club.all(:include => :UserClub)
    @news = News.new
    @options_for_select = @clubs.map do |club|
      [club.name,club.events.map(&:name)]
    end
  end

  def create
    @news = News.new news_params
    unless @news.save
      flash_error @news
    end
    render :show
  end

  def show
  end

  def index
  end

  def edit
  end

  private
  def news_params
    params.require(:news).permit(:club_id, :title, :content).merge! user_id: current_user.id
  end

end

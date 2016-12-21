class Management::NewsController < ApplicationController
  before_action :load_news, only: :show
  def new
    @news = News.new
    @event_id = params[:event_id]
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
    params.require(:news).permit(:event_id, :title,
      :content).merge! user_id: current_user.id, approve: true
  end

  def load_news
    @news = News.find_by id: params[:id]
    unless @news
      flash[:danger] = t("not_found")
    end
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :init_chatwork, only: :send_all

  include ApplicationHelper

  def user_signed_in
    unless user_signed_in?
      flash[:danger] = t("user.require_login")
      redirect_to root_url
    end
  end

  def current_user? user
    current_user == user
  end

  def correct_user
    @user = User.find_by id: params[:id]
    unless current_user?(@user)
      flash[:danger] = t("user.edit_require")
      redirect_to root_url
    end
  end

  def load_organization
    @organization = Organization.find_by id: params[:id]
    unless @organization
      flash[:danger] = t("cant_found")
      redirect_to root_url
    end
  end

  def to_all room_id
    init_chatwork
    body = ""
    ChatWork::Member.get(room_id: room_id).each do |member|
      body += "[To:#{member['account_id']}] "
    end
    body
  end

  def message_to_room room_id, content
    init_chatwork
    content += "\n#{to_all(room_id)}"
    ChatWork::Message.create room_id: room_id, body: content
  end

  def get_url controller, action
    url_for(controller: controller, action: action, host: request.base_url)
  end

  def get_path route_url
    "#{request.base_url}#{route_url}"
  end

  private
  def init_chatwork
    ChatWork.api_key = Figaro.env.api_chatwork
  end
end

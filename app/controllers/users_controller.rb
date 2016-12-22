class UsersController < ApplicationController
  before_action :user_signed_in
  before_action :load_user
  before_action :correct_user, only: [:edit, :update]

  def show
  end

  def update
    if @user.update_attributes user_params
      sign_in :user, @user, bypass: true
      flash[:success] = t "user.profile_updated"
      redirect_to root_path
    else
      flash[:danger] = t "user.cannot_updated"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :full_name, :email, :phone, :chatword, :password,
      :password_confirmation, :avatar
  end

  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t("user.cant_found")
      redirect_to root_url
    end
  end
end

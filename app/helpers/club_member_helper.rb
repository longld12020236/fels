module ClubMemberHelper
  private
  def load_club
    @club = Club.find_by_id params[:id]
    unless @club
      flash[:danger] = t("club_not_found")
      redirect_to root_path
    end
  end

  def club_params
    params.require(:club).permit :name, :description,
      :organization_id, :notification, :is_active
  end

  def load_organization
    @organizations = Organization.all
  end

  def user_login user
    session[:user_id] = user.id
  end
end

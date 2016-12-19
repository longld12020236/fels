class OrganizationsController < ApplicationController
  before_action :user_signed_in
  before_action :load_organization, except: [:new, :create]

  def show
  end
end

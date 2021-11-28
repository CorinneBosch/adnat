class UsersController < ApplicationController
  # before_action :authenticate_user!, :except[:index, :show]
  before_action :find_user

  def show
    @user
    is_org_member?
  end

  def join_organisation
    @organisation = Organisation.find(params[:org_id])
    @user.update(organisation_id: @organisation.id)
    redirect_to (organisations_path + "/#{@organisation.id}")
  end

  def leave_organisation
    org_name = find_left_organisation
    @user.update(organisation_id: nil)
    @user.shifts.destroy_all
    redirect_to organisations_path, notice: "Left #{org_name} and deleted shifts!"
  end

  private

  def find_user
    @user = User.find_by(id: current_user.id)
    redirect_to(root_url) unless @user == current_user
  end

  def find_left_organisation
    org = Organisation.find(@user.organisation_id)
    org.name
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def show
    @user
  end

  def join_organisation
    @organisation = Organisation.find(params[:org_id])
    @user.update(organisation_id: @organisation.id)
    redirect_to (organisations_path + "/#{@organisation.id}")
  end

  def leave_organisation
    @user = User.find_by(id: current_user.id)
    @user.update(organisation_id: nil)
    @user.shifts.destroy_all
    redirect_to organisations_path, notice: 'All shift deleted!'
  end

  private

  def find_user
    @user = User.find_by(id: current_user.id)
    redirect_to(root_url) unless @user == current_user
  end
end

class OrganisationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  
  def index
    already_org_member?
    @organisations = Organisation.all.order(created_at: :desc)
    @organisation = Organisation.new
  end

  def show
    @organisation = Organisation.find(params[:id])
    @org_shifts = @organisation.shifts.all.order(created_at: :desc)
  end

  def create
    @organisation = Organisation.create(org_params)

    if @organisation.save
      join_organisation
      redirect_to @organisation, notice: 'Organisation created successfully!'
    else
      render :new, notice: 'Oops something went wront.. Please try again!'
    end
  end

  def edit
    @organisation = Organisation.find(params[:id])
    # respond_to { |format| format.js }
  end

  def update
    @organisation = Organisation.find(params[:id])

    if @organisation.update(org_params)
      redirect_to @organisation, notice: 'Organisation updated successfully!'
    else
      render :edit, notice: 'Oops something went wront.. Please try again!'
    end
  end

  def destroy
    @organisation = Organisation.find(params[:id])
    @organisation.destroy
    redirect_to organisations_path, notice: 'Organisation successfully deleted!'
  end

  private

  def org_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end

  def find_user
    @user = User.find_by(id: current_user.id)
  end

  def join_organisation
    @user.update(organisation_id: @organisation.id)
  end

  def already_org_member?
    if @user.organisation_id != nil
      redirect_to (organisations_path + "/#{@user.organisation_id}")
    end
  end
end



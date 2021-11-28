class OrganisationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @organisations = Organisation.all.order(created_at: :desc)
    @organisation = Organisation.new
  end

  def show
    @organisation = Organisation.find(params[:id])
    @org_shifts = @organisation.shifts.all.order(created_at: :desc)
  end

  # def new
  #   @organisation = Organisation.new 
  # end

  def create
    @organisation = Organisation.create(org_params)
    if @organisation.save
      redirect_to @organisation, notice: 'Organisation created successfully!'
    else
      render :new, notice: 'Oops something went wront.. Please try again!'
    end
  end

  def edit
    @organisation = Organisation.find(params[:id])
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
end



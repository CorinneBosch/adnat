class OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all.order(created_at: :desc)
  end

  def show
    @organisation = Organisation.find(params[:id])
  end

  def new
    @organisation = Organisation.new 
  end

  def create
    @organisation = Organisation.create(org_params)
    if @organisation.save
      redirect_to @organisation #, notice: 'Organisation created successfully!'
    else
      render :new #, notice: 'Oops something went wront.. Please try again!'
    end
  end

  private

  def org_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end
end



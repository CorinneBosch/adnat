class ShiftsController < ApplicationController
  def create 
    @organisation = Organisation.find(params[:organisation_id])
    @shift = @organisation.shift.create(shift_params)
    redirect_to organisation_path(@organisation)
  end

  def show
    @shifts = @organisation.shift.all.order(created_at: :desc)
  end

  private
  def shift_params
    params.require(:shift).permit(:employee, :shift_start, :shift_end, :break_length)
  end
end

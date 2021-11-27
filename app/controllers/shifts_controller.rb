class ShiftsController < ApplicationController
  before_action :join_params, only: [:create]

  def create 
    @organisation = Organisation.find(params[:organisation_id])
    @shift = @organisation.shifts.create(shift_params)
    redirect_to organisation_path(@organisation), notice: 'Shift added!'
  end

  private
  def shift_params
    params.require(:shift).permit(:employee, :shift_start, :shift_end, :break_length)
  end

  def join_params
    if params[:shift].blank?
      return
    end
    shift_start_date = params[:shift].delete(:shift_start_date)
    shift_start_time = params[:shift].delete(:shift_start_time)

    # if shift_start_date.blank? || shift_start_time.blank?
    #   # TBC
    # else
    params[:shift][:shift_start] = Time.parse("#{shift_start_date} #{shift_start_time}")
    # end
  end
end

require 'time'

module ShiftsHelper
  def total_hours_worked(shift_start, shift_finish, break_min)
    finish_date = correct_finish_time(shift_start, shift_finish)

    min_worked = ((finish_date - shift_start) / 60) - break_min
    round_to_quarter(min_worked / 60)
  end
  
  def round_to_quarter(hours)
    (hours * 4).round / 4.0
  end

  private
  def correct_finish_time(date, time)
    Time.parse("#{date.strftime('%Y-%m-%d')} #{time.strftime('%H:%M')}")
  end
end

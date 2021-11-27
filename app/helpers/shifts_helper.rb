require 'time'

module ShiftsHelper
  def total_hours_worked(shift_start, shift_finish, break_min)
    finish = Time.parse(shift_finish.strftime('%H:%M'))

    min_worked = ((finish - shift_start) / 60) - break_min
    round_to_quarter(min_worked / 60)
  end

  # private
  def round_to_quarter(hours)
    (hours * 4).round / 4.0
  end
end

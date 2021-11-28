class ChangeColumnShiftEnd < ActiveRecord::Migration[6.1]
  def change
    change_column :shifts, :shift_end, :time, null: false
  end
end

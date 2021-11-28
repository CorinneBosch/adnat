class ChangeColumnShiftStart < ActiveRecord::Migration[6.1]
  def change
    change_column :shifts, :shift_start, :datetime, null: false
  end
end

class ChangeColumnBreakLength < ActiveRecord::Migration[6.1]
  def change
    change_column :shifts, :break_length, :integer, null: false
  end
end

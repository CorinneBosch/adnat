class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.string :employee, null: false
      t.datetime :shift_start, null: false
      t.time :shift_end, null: false
      t.integer :break_length, null: false
      t.references :organisation, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.string :employee
      t.datetime :shift_start
      t.time :shift_end
      t.integer :break_length
      t.references :organisation, null: false, foreign_key: true

      t.timestamps
    end
  end
end

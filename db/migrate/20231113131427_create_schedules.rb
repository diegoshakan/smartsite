class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :week_days
      t.string :hour
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end

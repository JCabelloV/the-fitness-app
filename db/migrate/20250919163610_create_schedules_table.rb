class CreateSchedulesTable < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules_tables do |t|
      t.timestamps
    end
  end
end

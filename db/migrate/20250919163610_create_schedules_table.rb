class CreateSchedulesTable < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules_tables do |t|
      t.datetime :horario
      t.string :status # Available, blocked, scheduled
      t.string :capacity # individual or tuple
      t.belongs_to :user # Reference to user
      t.belongs_to :trainer # Reference to Trainer
      t.timestamps
    end
  end
end

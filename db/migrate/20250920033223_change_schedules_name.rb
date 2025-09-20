class ChangeSchedulesName < ActiveRecord::Migration[8.0]
  def change
    rename_table(:schedules_tables, :schedules)
  end
end

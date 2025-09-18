class ChangeTrainersTableName < ActiveRecord::Migration[8.0]
  def change
    rename_table(:personal_trainers_tables, :trainers)
  end
end

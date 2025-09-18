class CreatePersonalTrainersTable < ActiveRecord::Migration[8.0]
  def change
    create_table :personal_trainers_tables do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :rut, null: false

      t.timestamps
    end
  end
end

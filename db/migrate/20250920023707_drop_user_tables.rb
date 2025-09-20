class DropUserTables < ActiveRecord::Migration[8.0]
  def change
    drop_table :user_tables do |t|
      t.string :first_name
      t.string :last_name
      t.integer :rut
      t.datetime :create_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end

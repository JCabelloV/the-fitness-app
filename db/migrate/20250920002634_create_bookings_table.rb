class CreateBookingsTable < ActiveRecord::Migration[8.0]
  def change
    create_table :bookings do |t|
      t.references :schedules_table, null: false, foreign_key: true
      t.references :trainer, null: false, foreign_key: true

      t.integer :kind, null: false, default: 0
      t.integer :status, null: false, default: 0

      t.integer :price, null: false, default: 0

      t.timestamps
    end
  end
end

class RenameSchedulesTableId < ActiveRecord::Migration[8.0]
    def up
    # 1) Renombrar columna si existe
    if column_exists?(:bookings, :schedules_table_id)
      rename_column :bookings, :schedules_table_id, :schedule_id
    end

    # 2) Eliminar FK viejo (por si existiera)
    if foreign_key_exists?(:bookings, :schedules, column: :schedules_table_id)
      remove_foreign_key :bookings, column: :schedules_table_id
    end

    # 3) Agregar FK correcto
    unless foreign_key_exists?(:bookings, :schedules, column: :schedule_id)
      add_foreign_key :bookings, :schedules, column: :schedule_id
    end

    # 4) Índices: quitar antiguos y crear el único en schedule_id
    if index_name_exists?(:bookings, "index_bookings_on_schedules_table_id")
      remove_index :bookings, name: "index_bookings_on_schedules_table_id"
    end

    if index_exists?(:bookings, :schedule_id)
      remove_index :bookings, :schedule_id
    end

    add_index :bookings, :schedule_id,
              unique: true,
              name: "index_bookings_on_schedule_id_unique"
  end

  def down
    # revertir índice y FK nuevos
    remove_index :bookings, name: "index_bookings_on_schedule_id_unique" if index_name_exists?(:bookings, "index_bookings_on_schedule_id_unique")
    remove_foreign_key :bookings, column: :schedule_id if foreign_key_exists?(:bookings, :schedules, column: :schedule_id)

    # restaurar FK/índice antiguos y nombre de columna
    add_foreign_key :bookings, :schedules, column: :schedules_table_id unless foreign_key_exists?(:bookings, :schedules, column: :schedules_table_id)
    if column_exists?(:bookings, :schedule_id)
      rename_column :bookings, :schedule_id, :schedules_table_id
    end
    add_index :bookings, :schedules_table_id, name: "index_bookings_on_schedules_table_id" unless index_name_exists?(:bookings, "index_bookings_on_schedules_table_id")
  end
end

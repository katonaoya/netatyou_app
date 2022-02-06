class CreateComedians < ActiveRecord::Migration[6.1]
  def change
    create_table :comedians do |t|
      t.integer :live_id, forign_key: true, null: false
      t.integer :unit_id, forign_key: true, null: false
      t.integer :neta_id
      t.integer :turn

      t.timestamps
    end
    add_index :comedians, :live_id
    add_index :comedians, :unit_id
    add_index :comedians, :neta_id
    add_index :comedians, %i[live_id unit_id]
    add_index :comedians, %i[live_id neta_id]
    add_index :comedians, %i[unit_id neta_id]
  end
end

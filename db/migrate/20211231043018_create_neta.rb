class CreateNeta < ActiveRecord::Migration[6.1]
  def change
    create_table :neta do |t|
      t.string :title, null: false
      t.text :dialogue, null: false
      t.string :item
      t.integer :minute
      t.integer :second
      t.integer :unit_id, forign_key: true

      t.timestamps
    end
  end
end

class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :solicitation_id
      t.integer :participation_id
      
      t.timestamps
    end
    add_index :relationships, :solicitation_id
    add_index :relationships, :participation_id
    add_index :relationships, [:solicitation_id, :participation_id], unique: true
  end
end

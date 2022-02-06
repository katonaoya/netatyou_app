class CreateStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|
      t.string :position
      t.integer :user_id, null: false
      t.integer :live_id, null: false

      t.timestamps
    end
    add_index :staffs, :user_id
    add_index :staffs, :live_id
    add_index :staffs, %i[live_id user_id]
  end
end

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :role, null: false
      t.string :skill
      t.date :birthday
      t.text :profile
      t.integer :main_unit_id

      t.timestamps

      t.index :email, unique: true
    end
  end
end

class CreateLives < ActiveRecord::Migration[6.1]
  def change
    create_table :lives do |t|
      t.string :title, null: false
      t.string :theater
      t.date :date
      t.string :item
      t.integer :user_id, forign_key: true

      t.timestamps
    end
  end
end

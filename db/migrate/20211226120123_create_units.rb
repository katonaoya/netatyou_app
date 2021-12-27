class CreateUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :units do |t|
      t.string :name, null: false
      t.string :kana, null: false
      t.date :birthday, null: false
      t.string :belongs, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

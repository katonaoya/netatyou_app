class CreateUnitsAndUsersReference < ActiveRecord::Migration[6.1]
  def change
    create_join_table :units, :users do |t|
      t.index :unit_id
      t.index :user_id
    end
  end
end

class CreateUnitsAndUsersReference < ActiveRecord::Migration[6.1]
  def change
    create_table :units_and_users, id: false do |t|
      t.belongs_to :unit
      t.belongs_to :user
    end
  end
end

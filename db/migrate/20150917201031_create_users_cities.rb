class CreateUsersCities < ActiveRecord::Migration
  def change
    create_table :users_cities do |t|
      t.references :user, index: true, foreign_key: true
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

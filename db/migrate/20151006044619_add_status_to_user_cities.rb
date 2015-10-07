class AddStatusToUserCities < ActiveRecord::Migration
  def change
    add_column :users_cities, :status, :integer
  end
end

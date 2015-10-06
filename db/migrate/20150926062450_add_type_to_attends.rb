class AddTypeToAttends < ActiveRecord::Migration
  def change
    add_column :attends, :type, :integer
  end
end

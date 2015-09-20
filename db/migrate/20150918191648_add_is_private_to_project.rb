class AddIsPrivateToProject < ActiveRecord::Migration
  def change
    add_column :projects, :is_private, :boolean
  end
end

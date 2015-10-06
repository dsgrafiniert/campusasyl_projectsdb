class RenameTypeColumnInAttends < ActiveRecord::Migration
  def change
    rename_column :attends, :type, :status
    
  end
end

class AlterAttend < ActiveRecord::Migration
  def change
    add_column :attends, :event_occurrence_id, :integer
    remove_column :attends, :event_id
  end
end

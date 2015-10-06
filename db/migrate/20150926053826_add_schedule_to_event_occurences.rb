class AddScheduleToEventOccurences < ActiveRecord::Migration
  def change
    add_column :event_occurrences, :schedulable_id, :integer
    add_column :event_occurrences, :schedulable_type, :integer
  end
end

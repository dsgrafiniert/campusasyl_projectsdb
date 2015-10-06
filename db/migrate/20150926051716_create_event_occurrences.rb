class CreateEventOccurrences < ActiveRecord::Migration
  def change
    create_table :event_occurrences do |t|
      t.integer :event_id
      t.datetime :date

      t.timestamps null: false
    end
  end
end

class CreateCapabilities < ActiveRecord::Migration
  def change
    create_table :capabilities do |t|

      t.timestamps null: false
    end
  end
end

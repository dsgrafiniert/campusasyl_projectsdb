class CreateCityParticipations < ActiveRecord::Migration
  def change
    create_table :city_participations do |t|
      t.integer :status
      t.references :participant, index: true
      t.references :city, index: true

      t.timestamps null: false
    end
  end
end

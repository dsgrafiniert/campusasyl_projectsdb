class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.references :city, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.datetime :time
      t.boolean :urgent
      t.integer :required_people

      t.timestamps null: false
    end
  end
end

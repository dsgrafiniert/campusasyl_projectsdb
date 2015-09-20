class AddNameToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :name, :string
    add_column :uploads, :description, :text
  end
end

class AddProjectToUploads < ActiveRecord::Migration
  def change
    add_reference :uploads, :project, index: true, foreign_key: true
  end
end

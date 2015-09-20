class AddRequiredPeopleToEvents < ActiveRecord::Migration
  def change
    add_column :events, :required_people, :integer
  end
end

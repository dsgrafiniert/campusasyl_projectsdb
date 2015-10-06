class AddInviteToCity < ActiveRecord::Migration
  def change
    add_column :cities, :invitationHash, :string
  end
end

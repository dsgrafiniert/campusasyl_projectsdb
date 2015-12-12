class AddInvitationHashToParticipation < ActiveRecord::Migration
  def change
    add_column :participations, :invitationHash, :string
  end
end

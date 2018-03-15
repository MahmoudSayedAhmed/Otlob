class AddInvitaionToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :invited, foreign_key: true
  end
end

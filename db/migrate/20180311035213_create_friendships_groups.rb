class CreateFriendshipsGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships_groups, id: false do |t|
      t.belongs_to :friendship, index: true
      t.belongs_to :group, index: true
    end
  end
end

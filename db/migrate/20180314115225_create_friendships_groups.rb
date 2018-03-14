class CreateFriendshipsGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships_groups, id: false do |t|
      t.belongs_to :friendship, index: true
      t.belongs_to :group, index: true
    end
    execute "ALTER TABLE friendships_groups ADD PRIMARY KEY (friendship_id,group_id);"
  end
end
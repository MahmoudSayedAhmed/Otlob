class AddAttachmentUimageToUsers < ActiveRecord::Migration[4.2]
  def self.up
    change_table :users do |t|
      t.attachment :uimage
    end
  end

  def self.down
    remove_attachment :users, :uimage
  end
end
class AddAttachmentImageToOrders < ActiveRecord::Migration[5.1]
  def self.up
    change_table :orders do |t|
      t.attachment :Menu
    end
  end

  def self.down
    remove_attachment :users, :Menu
  end
end

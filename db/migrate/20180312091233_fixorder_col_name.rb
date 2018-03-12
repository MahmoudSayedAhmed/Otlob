class FixorderColName < ActiveRecord::Migration[5.1]
  def self.up
  rename_column :orders, :type, :orderType
  end
end

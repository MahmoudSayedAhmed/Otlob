class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :amount
      t.integer :price
      t.string :comment
      t.references :joined, foreign_key: true

      t.timestamps
    end
  end
end

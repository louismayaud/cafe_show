class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :user, foreign_key: true
      t.references :coffee, foreign_key: true
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end

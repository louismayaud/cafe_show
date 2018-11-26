class CreateCoffees < ActiveRecord::Migration[5.2]
  def change
    create_table :coffees do |t|
      t.float :price_per_unit
      t.integer :intensity
      t.string :machine
      t.string :flavour
      t.string :country_origin
      t.integer :stock
      t.integer :unit_sold
      t.string :picture
      t.string :blend_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

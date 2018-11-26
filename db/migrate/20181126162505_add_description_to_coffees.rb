class AddDescriptionToCoffees < ActiveRecord::Migration[5.2]
  def change
    add_column :coffees, :description, :text
  end
end

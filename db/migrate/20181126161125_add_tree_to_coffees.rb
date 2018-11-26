class AddTreeToCoffees < ActiveRecord::Migration[5.2]
  def change
    add_column :coffees, :tree, :string
  end
end

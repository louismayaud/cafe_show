class RemovePhotoFromCoffees < ActiveRecord::Migration[5.2]
  def change
     remove_column :coffees, :photo, :string
  end
end

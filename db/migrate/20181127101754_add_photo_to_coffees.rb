class AddPhotoToCoffees < ActiveRecord::Migration[5.2]
  def change
    add_column :coffees, :photo, :string
  end
end

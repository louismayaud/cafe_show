class AddGradeToCoffees < ActiveRecord::Migration[5.2]
  def change
    add_column :coffees, :grade, :integer
  end
end

class IntensityChangeColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column(:coffees, :intensity, :string)
  end
end

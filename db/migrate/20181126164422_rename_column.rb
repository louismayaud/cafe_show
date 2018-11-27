class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :coffees, :country_origin, :provenance
  end
end

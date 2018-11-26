class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :billing_information, :string
    add_column :users, :address, :string
    add_column :users, :introduction, :text
    add_column :users, :avatar, :string
  end
end

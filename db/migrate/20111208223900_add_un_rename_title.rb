class AddUnRenameTitle < ActiveRecord::Migration
  
  def change
    rename_column :users, :title, :name
    add_column :users, :user_name, :string
  end
  
end

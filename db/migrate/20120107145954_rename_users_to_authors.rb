class RenameUsersToAuthors < ActiveRecord::Migration
  def change
    rename_table :users, :authors
  end
end

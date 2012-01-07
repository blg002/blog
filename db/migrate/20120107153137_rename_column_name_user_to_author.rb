class RenameColumnNameUserToAuthor < ActiveRecord::Migration
  def up
    rename_column :articles, :user_id, :author_id
  end

  def down
    rename_column :articles, :author_id, :user_id
  end
end

class CreateArticlesTable < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :user

      t.timestamps
    end
    add_index :articles, :user_id
  end
end

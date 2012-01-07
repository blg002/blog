class CreateCategorizationsTable < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :article_id
      t.integer :category_id
    end
    add_index :categorizations, :article_id
    add_index :categorizations, :category_id
  end
end

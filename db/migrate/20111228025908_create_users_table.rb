class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_name
      t.string :email
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
  end
end

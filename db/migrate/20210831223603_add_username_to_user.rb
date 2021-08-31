class AddUsernameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :username_seed, :integer
    add_index :users, [:username, :username_seed], unique: true
  end
end

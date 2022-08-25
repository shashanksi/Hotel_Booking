class AddUserDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :fullname, :string
    add_column :users, :accno, :string
    add_column :users, :phoneno, :string
  end
end

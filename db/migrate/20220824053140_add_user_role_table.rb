class AddUserRoleTable < ActiveRecord::Migration[7.0]
   def change
    create_table :relation, id: false do |t|
      t.belongs_to :role
      t.belongs_to :user
    end
  end

end

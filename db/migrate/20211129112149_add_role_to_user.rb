class AddRoleToUser < ActiveRecord::Migration[6.1]
  def change
    add_references :users, :role_id, :integer
  end
end

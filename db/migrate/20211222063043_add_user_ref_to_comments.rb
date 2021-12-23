class AddUserRefToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :user, null: false
  end
end

class AddUserRefToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :user, null: false
  end
end

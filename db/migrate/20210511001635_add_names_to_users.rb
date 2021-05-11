class AddNamesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :user, null: false, foreign_key: true
    add_column :posts, :item, :text
  end
end

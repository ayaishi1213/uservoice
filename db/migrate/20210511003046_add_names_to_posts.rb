class AddNamesToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :content, :text
  end
end

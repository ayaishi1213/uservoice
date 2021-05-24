class RemoveAuthorFromTitles < ActiveRecord::Migration[6.0]
  def change
    remove_column :titles, :age, :integer
  end
end

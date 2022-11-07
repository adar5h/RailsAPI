class RemoveNameInUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :author, :string
    remove_column :users, :body, :string
  end
end

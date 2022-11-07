class AddNameInUser2 < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :author, :string
    add_column :users, :body, :text
  end
end

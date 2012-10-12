class AddNestedToBooks < ActiveRecord::Migration
  def change
    add_column :books, :parent_id, :integer
    add_column :books, :lft, :integer
    add_column :books, :rgt, :integer
  end
end
